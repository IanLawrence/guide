    # Automated/Chef to a hosted/cloud server with Jenkins CI
This section describes how to setup a new hosted/cloud server using Jenkins CI as the deployment agent.

The assumption here is that the CI is already setup and accessible at https://ci.rapidftr.com

## Requirements
* You need:
    * A target server where you want RapidFTR to be installed (this can be a fresh machine with nothing installed)
    * Domain name of the target server i.e. (dev.rapidftr.com) this is used to access the server browser.

## Supported Systems
* Ubuntu 14.04 64 bit **tested and recommend**
* Or any system that can run Docker. Check this [compatibility list](https://github.com/bflad/chef-docker/blob/master/COMPATIBILITY.md)

## Preparing the target server
Before we can deploy RapidFTR to the target server, we need to prepare it for CI based deployment.
* Create ssh keys and upload them to the server see ([SSH setup](ssh.md))

## Create a CI Job to handle deployment
### Add global credentials

1. Add global credential of **SSH Username with private key** kind
2. Copy the private key created above and paste in the key field of the credentials form.

### Create new CI job and configure parameters

1. The short approach is to clone an existing job i.e **DeployMasterToUAT**
    1. Log into the CI with the credentials provided by the administrator
    2. Click on create **New Item**
    3. Enter the Item name and select copy existing item and enter the name of the Job/item you would like to clone.
    4. Edit the cloned item and configure it to match you deployment needs.
2. The longer approach is to create a new job from scratch
    1. Log into the ci with the credentials provided by the administrator and
    2. Click on create **New Item**
    3. Enter Item name i.e DeployToServer and select **Build a free style software project**
    4. Add configuration to the following sections;
        1. **Discard old builds** - select the log rotation strategy and specify the number of details for which to keep the old builds and the number of builds to keep.
        2. **Restrict where this project is run** - specify a label expression "devdeploy" this is to select the node/slave on which the build will take place.
        3. **Source code management** - select git and specify;
            * **Repository url** - git repository where the code is hosted.
            * **credentials** if there are any required for the repository
            * **Branches to build** specify the release branch
            * Leave the rest of the parameters as defaults.
        4. **Build Environment** - this helps configure the environment that the CI will setup in order to build the project.
            * Check the **Run the build in a RVM-managed environment** and specify the implementation to **2.1.2@rapidftr**
            * Check the **SSH Agent** and specify the "SSH username and private key" credential that you created in the "Add global credential" step.
        5. ** Build ** - since this is a free style software project. we have to define custom steps for the build process so we;
            * select the "Execute shell" step and enter the shell commands to run.
                  #!/bin/bash -le
                  cd infrastructure
                  bundle install
                  echo '{"run_list":["role[production]"]}' > nodes/<ipaddress>.json
                  bundle exec knife solo bootstrap root@<ipaddress/domainname> --no-host-key-verify --clean-up
        6. ** Post Build Action ** - here we only configure the **Retry build after failure** to re-run the build incase of a failure. This is necessary especially if something happened during the deployment e.g. a timeout during a deployment.
            * Specify the delay before retrying the build to a fixed value of 60 (seconds)
            * Specify the maximum number of successive failed builds to 2. - If the build fails twice, don't attempt a retry.
        7. when done with the configuration, click the "Apply" button to save the changes and click the "Build Now" button to start the build process.


