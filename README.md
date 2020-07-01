# Introduction
This Docker repository is for those who want to have a continues delivery for their Java Projects with Maven and JavaFX.

## Built With
- [JDK 8 (251)](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)
  - contains JavaFX other than the JDK itself
- [Maven 3.6.3](https://maven.apache.org)
  -  a build automation tool used primarily for Java projects. 
- [Launch4j 3.12](https://sourceforge.net/projects/launch4j/files/launch4j-3/3.12/)
  - a cross-platform tool for wrapping Java applications distributed as jars in lightweight Windows native executables.
- [NSIS](https://nsis.sourceforge.io/Main_Page)
  - a professional open source system to create Windows installers
  
 ## Commands
> Maven is available via `mvn`

> Launch4j is available via `launch4j`

> NSIS is available via `makensis`

## Usage
This example is given that you already have [Launch4j XML configuration](http://launch4j.sourceforge.net/docs_es.html), and [NSIS script](https://nsis.sourceforge.io/Simple_tutorials). If you don't have any of this, please visit the links first to know more.
```
# Build the .JAR via maven command
mvn package

# Create the exe file via Launch4j
launch4j /path/to/your/configuration.xml

# Create the installer via NSIS
makensis /path/to/your/script.nsi


# and voila!
```


# Authors

* [Jaype Sison](https://github.com/jpsison-io)

# License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
