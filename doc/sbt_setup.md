# when using SBT to build scala project 

If stuck in below issues, then try the reposities setting to speed up related tool/lib downloading

- Getting org.scala-sbt sbt x.x.x (this may take some time) ...
- Dump project structure from sbt 


```bash
tee ~/.sbt/repositories << EOF
[repositories]
local
huaweicloud-maven: https://repo.huaweicloud.com/repository/maven/
maven-central: https://repo1.maven.org/maven2/
sbt-plugin-repo: https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
EOF
```
