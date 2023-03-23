#!/bin/bash

sed -i~ "/<servers>/ a\
<server>\
  <id>mulesoft-releases</id>\
  <username>${MAVEN_NEXUS_USERNAME}</username>\
  <password>${MAVEN_NEXUS_PASSWORD}</password>\
</server>\
<server>\
  <id>MuleRepository</id>\
  <username>${MAVEN_NEXUS_USERNAME}</username>\
  <password>${MAVEN_NEXUS_PASSWORD}</password>\
</server>\
<server>\
  <id>anypoint-exchange-v2</id>\
  <username>${CH_DEPLOY_USER}</username>\
  <password>${CH_DEPLOY_PASS}</password>\
</server>" /usr/share/maven/conf/settings.xml

sed -i "/<profiles>/ a\
<profile>\
	<id>Mule</id>\
	<activation>\
		<activeByDefault>true</activeByDefault>\
	</activation>\
	<repositories>\
		<repository>\
			<id>MuleRepository</id>\
			<name>MuleRepository</name>\
			<url>https://repository.mulesoft.org/nexus-ee/content/repositories/releases-ee/</url>\
			<layout>default</layout>\
			<releases>\
				<enabled>true</enabled>\
			</releases>\
			<snapshots>\
				<enabled>true</enabled>\
			</snapshots>\
		</repository>\
		<repository>\
			<id>mulesoft-releases</id>\
			<name>MuleSoft Repository</name>\
			<url>http://repository.mulesoft.org/releases/</url>\
			<layout>default</layout>\
		</repository>\
		<repository>\
			<id>mulesoft-public</id>\
			<name>MuleSoft Public Repository</name>\
			<url>https://repository.mulesoft.org/nexus/content/repositories/public/</url>\
			<layout>default</layout>\
		</repository>\
		<repository>\
			<id>mulesoft-snapshots</id>\
			<name>MuleSoft Snapshot Repository</name>\
			<url>http://repository.mulesoft.org/snapshots/</url>\
			<layout>default</layout>\
		</repository>\
	</repositories>\
</profile>" /usr/share/maven/conf/settings.xml