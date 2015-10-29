#!/bin/sh 
# echo "Unpacking dmw-transformer.zip"
#rm -rf dmw-transformer
#unzip dmw-transformer.zip

# The following has the Flight Recorder on for debugging.
#export JAVA_OPTS="-Xms$1 -Xmx$1 -XX:+AggressiveOpts -XX:+AggressiveHeap -verbose:gc -XX:-PrintGCDetails -XX:-PrintGCTimeStamps -Dlicense.dir=. -Dlog4j.configuration=file:log4j2.xml -Ddmw-context=$2 -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:FlightRecorderOptions=defaultrecording=true,disk=true,dumponexit=true,maxsize=2G,settings=DMW.jfc"

# The following does not have Flight Recorder on.
export JAVA_OPTS="-Xms$1 -Xmx$1 -XX:+AggressiveOpts -XX:+AggressiveHeap -verbose:gc -XX:-PrintGCDetails -XX:-PrintGCTimeStamps -Dlicense.dir=. -Dlog4j.configuration=file:log4j2.xml -Ddmw-context=$2"

export CLASSPATH_PREFIX=$(find lib -name '*.jar' -print | tr '\n' ':')
echo "JAVA OPTS"
echo $JAVA_OPTS
echo "CLASSPATH_PREFIX"
echo $CLASSPATH_PREFIX
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
dmw-transformer/bin/dmwTransformerApp.sh -dmwHome dmw-transformer
