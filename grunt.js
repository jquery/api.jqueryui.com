var rimraf = require( "rimraf" );

module.exports = function( grunt ) {

var entryFiles = grunt.file.expandFiles( "entries/*.xml" );

grunt.loadNpmTasks( "grunt-wordpress" );
grunt.loadNpmTasks( "grunt-jquery-content" );
grunt.loadNpmTasks( "grunt-check-modules" );

grunt.initConfig({
	lint: {
		grunt: "grunt.js"
	},
	xmllint: {
		all: [].concat( entryFiles, "categories.xml", "entries2html.xsl", "notes.xsl" )
	},
	xmltidy: {
		all: [].concat( entryFiles, "categories.xml" )
	},
	"build-pages": {
		all: grunt.file.expandFiles( "pages/**" )
	},
	"build-xml-entries": {
		all: entryFiles
	},
	"build-resources": {
		all: grunt.file.expandFiles( "resources/**" )
	},
	wordpress: grunt.utils._.extend({
		dir: "dist/wordpress"
	}, grunt.file.readJSON( "config.json" ) )
});

grunt.registerTask( "clean", function() {
	rimraf.sync( "dist" );
});

grunt.registerTask( "manifest", "Generate categories.json manifest file", function() {
	var categories,
		categoryPosts = {},
		done = this.async();

	categories = require( "./" + grunt.config( "wordpress.dir" ) + "/taxonomies" ).category;
	categories.forEach(function( category ) {
		category.posts = categoryPosts[ category.slug ] = [];
	});

	grunt.helper( "wordpress-walk-posts", grunt.config( "wordpress.dir" ), function( post, callback ) {
		if ( post.termSlugs && post.termSlugs.category ) {
			post.termSlugs.category.forEach(function( slug ) {
				categoryPosts[ slug ].push( post );
			});
		}
		callback();
	}, function( error ) {
		if ( error ) {
			grunt.error.log( error.message );
			return done( false );
		}

		grunt.file.write( grunt.config( "wordpress.dir" ) + "/categories.json",
			JSON.stringify( categories, null, "\t" ) + "\n" );
		done();
	});
});

grunt.registerTask( "default", "build-wordpress" );
grunt.registerTask( "build", "build-pages build-xml-entries build-xml-categories build-resources build-xml-full" );
grunt.registerTask( "build-wordpress", "check-modules clean lint xmllint build" );
grunt.registerTask( "tidy", "xmllint xmltidy" );

};
