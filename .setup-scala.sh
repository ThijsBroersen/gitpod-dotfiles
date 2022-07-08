#!/bin/zsh

sdk install java 22.1.0.r17-grl

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
chmod +x cs
eval "$(./cs setup --yes)"
rm cs
cs install metals
cs install bloop --only-prebuilt=true

mkdir -p ~/.bloop
echo '{"javaOptions": ["-Xms1G","-Xmx8G","-Xss64m","-XX:ReservedCodeCacheSize=256M","-XX:MaxInlineLevel=20","-XX:+UseParallelGC","-Dfile.encoding=UTF-8"]}' > ~/.bloop/bloop.json
