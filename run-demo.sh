#!/usr/bin/env bash

clear

run() {
  echo -e "\\033[1m\$ $*\\033[0m"
  $*
}

commentaire() {
  echo ""
  echo -e "\\033[32m# $*\\033[0m"
}

enter() {
  echo -en "\\033[31m[...]\\033[0m"
  read
}

show() {
  #echo -en "\\033[92m"
  $* | pygmentize -l xml
  #echo -en "\\033[0m"
  enter
}

commentaire "build without toolchains but running JDK 9"
j9
run mvn -V clean package

unzip -t multirelease/target/*.jar | grep -v "/ " | grep -v "maven"
run unzip -p multirelease/target/*.jar META-INF/MANIFEST.MF

enter

commentaire "Run Multi Release JAR with JRE 7"
j7
run java -classpath multirelease/target/*.jar base.Base

commentaire "Run Multi Release JAR with JRE 8"
j8
run java -classpath multirelease/target/*.jar base.Base

commentaire "Run Multi Release JAR with JRE 9 classic"
j9
run java -classpath multirelease/target/*.jar base.Base

commentaire "Run Multi Release JAR with JRE 9 Jigsaw"
jig
run java -classpath multirelease/target/*.jar base.Base

enter

commentaire "build *with* toolchains from JRE 7 to check that base does not compile (dependency on JDK 8, even if code not used)"
j7
run mvn -V -Ptoolchain clean package

enter

commentaire "same failure with Compiler for Older Platform: javac -release 7"
j9
javac -release 7 multirelease-base/src/main/java/*/*.java
