FROM sonatype/nexus3:3.37.1

# Env
ENV APK_BUNDLE_VERSION=0.0.23
ENV COMPOSER_BUNDLE_VERSION=0.0.18

# Nexus properties
RUN echo "nexus.onboarding.enabled=false" >> ${NEXUS_HOME}/etc/nexus-default.properties
RUN echo "nexus.scripts.allowCreation=true" >> ${NEXUS_HOME}/etc/nexus-default.properties
RUN echo "nexus.security.randompassword=false" >> ${NEXUS_HOME}/etc/nexus-default.properties

# Extra karaf bundle
USER root
RUN curl -L https://repo1.maven.org/maven2/org/sonatype/nexus/plugins/nexus-repository-apk/${APK_BUNDLE_VERSION}/nexus-repository-apk-${APK_BUNDLE_VERSION}-bundle.kar -o /opt/sonatype/nexus/deploy/nexus-repository-apk-${APK_BUNDLE_VERSION}-bundle.kar
RUN curl -L https://repo1.maven.org/maven2/org/sonatype/nexus/plugins/nexus-repository-composer/${COMPOSER_BUNDLE_VERSION}/nexus-repository-composer-${COMPOSER_BUNDLE_VERSION}-bundle.kar  -o /opt/sonatype/nexus/deploy/nexus-repository-composer-${COMPOSER_BUNDLE_VERSION}-bundle.kar 
USER nexus
