CompressionModule
------

This is a Titanium Apcelerator module - a wrapper for ZipArchive to enable file compression features within an appcelerator project.

### Basic Documentation
* Install compressionmodule-iphone-x.x.zip as described in the Appcelerator documentation for installing modules: http://developer.appcelerator.com/doc/mobile/iphone/module_sdk
* Include the module in your projects tiapp.xml file:
    <modules>
        <module version="0.1">CompressionModule</module>
    </modules>
* Use the module as needed:
** The compressFile() method will return a string for the file path to the compressed zip file. It puts the file in a temporary directory.
** You can create a TiFile object using this path.
    var zipFilePath = Ti.Compression.compressFile(filePathForFileToCompress);
    var zipFile = Ti.Filesystem.getFile(zipFilePath);
