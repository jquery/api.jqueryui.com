module.exports = function( grunt ) {

var entryFiles = grunt.file.expandFiles( "entries/*.xml" );

grunt.loadNpmTasks( "grunt-clean" );
grunt.loadNpmTasks( "grunt-wordpress" );
grunt.loadNpmTasks( "grunt-jquery-content" );

grunt.initConfig({
	clean: {
		folder: "dist"
	},
	lint: {
		grunt: "grunt.js"
	},
	// TODO would be useful, but throws broken exceptions when a change is detected
	watch: {
		files: "entries/**",
		tasks: "grunt deploy"
	},
	xmllint: {
		all: [].concat( entryFiles, "cat2tax.xsl", "categories.xml", "entries2html.xsl", "xml2json.xsl" )
	},
	xmltidy: {
		all: [].concat( entryFiles, "categories.xml" )
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

grunt.registerTask( "default", "build-wordpress" );
grunt.registerTask( "build-wordpress", "clean lint xmllint build-xml-entries build-xml-categories build-resources" );
grunt.registerTask( "tidy", "xmllint xmltidy" );

};
