# Automated APK deployment to Google Play Store with Jenkins CI
This section describes automated CI setup for RapidFTR apk deployment to google playstore.

## Requirements
What was needed:
* Google Play Developer account  - this was registered to rapidftrdev@gmail.com
* OAuth Service Account created for the CI

## Preparing the developer account
In order to publish the apk, we needed to prepare the developer account according to the instructions here;
 * http://developer.android.com/distribute/googleplay/start.html
 * http://developer.android.com/distribute/googleplay/developer-console.html

## Creating the CI Job to handle deployment
### Adding global credentials
1. A global credential of type "Google Service Account from Private Key" was created with a P12 key.

### Creating & configuring a CI Job
* A free-style software project was created. The following environment variables were specified as part of the build.
    1. SDK_DIR  - default value **android/23** this is the folder in the build workspace where the android sdk will be downloaded.
    2. RAPIDFTR_KEY_PASSWORD - Password of the apk signing key
    3. RAPIDFTR_KEYSTORE_PASSWORD - Password of the keystore containing the signing key
    4. SIGNING_CERTIFICATE - The APK signing certificate
    5. SIGNING_KEY - The apk private key associated with the certificate.

* A shell build step was added to build, sign and zipalign the apk.
* A post build step was added to upload the apk to the playstore account under the "beta" stream.

**Please note:** For the CI job to sucessfully upload the apk, the versionCode defined in the apk's AndroidManifest.xml file has to be different (either lower or higher) from the existing apk in the playstore.

**Notes:**

More information on how to configure the Google Play Android Publisher plugin can be found https://wiki.jenkins-ci.org/display/JENKINS/Google+Play+Android+Publisher+Plugin

Understanding how to setup environment variables with the credentials binding plugin can be found
https://wiki.jenkins-ci.org/display/JENKINS/Credentials+Binding+Plugin

