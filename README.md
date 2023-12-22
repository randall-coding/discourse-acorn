# Launch a Discourse Server

## Discourse
Discourse is a robust and open-source discussion platform designed for community engagement. Featuring modern design and intuitive navigation, it fosters dynamic conversations with powerful moderation tools, ensuring a vibrant and interactive online community experience.

In this tutorial, we'll be integrating Discourse as a standalone node within your microservice architecture.

To make the process even simpler, we will deploy our Discourse instance using an acorn image.

## What is Acorn? 
Acorn is a new cloud platform that allows you to easily deploy, develop and manage web services with containerization.  A single acorn image can deploy all that you need: from a single container webserver, to a multi service Kubernetes cluster with high availability.  Don't worry if you don't understand what all those terms mean; we don't have to know that in order to deploy our server.

## Setup Acorn Account
Setup an acorn account at [acorn.io](https://acorn.io).  This can be a free account for your first deployment, and if you'd like additional storage space you can look into the pro account or enterprise.  You will need a Github account to signup as shown in the image below.

![signin_acorn](https://github.com/randall-coding/opensupports-docker/assets/39175191/d46815fb-d2d5-42cd-b93d-41ca541a63bd)

## Install acorn cli 
First we need to install acorn-cli locally.  Choose an install method from the list below:

**Linux or Mac** <br>
`curl https://get.acorn.io | sh`

**Homebrew (Linux or Mac)** <br>
`brew install acorn-io/cli/acorn`

**Windows** <br> 
Uncompress and move the [binary](https://cdn.acrn.io/cli/default_windows_amd64_v1/acorn.exe) to your PATH

**Windows (Scoop)** <br>
`scoop install acorn`

For up to date installation instructions, visit the [official docs](https://runtime-docs.acorn.io/installation/installing).

## Login with CLI
Back in our local command terminal login to acorn.io with: <br>
`acorn login acorn.io` 

## Preparing Secrets
Your server has settings controlled by a "secrets" object:  
 * **discourse/discourse_password** - your chosen discourse password for user `discourse` (must be at least 10 characters)
 * **discourse/smtp_host** - (optional) your host for `smtp`
 * **discourse/smtp_port** - (optional) your port for `smtp`
 * **discourse/smtp_user** - (optional) your user for `smtp`
 * **discourse/smtp_password** - (optional) your password for `smtp`

Create secrets for your application using acorn-cli.  Change the <> values to your actual credentials.
```
acorn secret create discourse --data discourse_password=<password> \
                              --data smtp_host=<host or blank> \
                              --data smtp_port=<port or blank> \
                              --data smtp_user=<user or blank> \
                              --data smtp_password=<password or blank> 
```

## Deploying Acorn
Now that we have the acorn cli configured, we can deploy our acorn image with a few simple commands.

Clone the repo locally if you haven't already with:

`git clone https://github.com/randall-coding/discourse-acorn.git`

Next build and run.  You can modify the container RAM by editing the `run` command.

`acorn build -t discourse`

`acorn run -s discourse:discourse -n discourse discourse`

Visit your acorn dashboard to see if your deployment was successful.

Click on the discourse deployment, and find the endpoint section on the right side panel.  This is your discourse instance link.

![discourse_acorn_ui](https://github.com/randall-coding/discourse-private/assets/39175191/74333113-f0ab-40bd-8f08-404790eb48ad)

![discourse_endpoint](https://github.com/randall-coding/discourse-private/assets/39175191/680cbcc4-d95f-48c1-aa47-1c14ed1e31cf)

If there are any errors check your acorn via the UI or with the following command:

`acorn logs -f discourse`

You can login into your admin account using:

- USERNAME: discourse
- PASSWORD: <discourse_secret_password_that_you_defined>

## Configure Discourse

You can define server's mailer configuration by setting the smtp values in the secrets object defined previously.  This allows your server to send notification emails to users and administrators.

For more detailed instructions on working with your Discourse server see the getting started and configuration documentation.

## Conclusion
That's all there is to it.  We've now got a discourse server up and running from an acorn image.

<img width="1093" alt="image" src="https://github.com/randall-coding/discourse-private/assets/23367718/84da72b1-5f43-42c2-b119-84e6755e1bb4">


## References
* [Getting started with Discourse](https://blog.discourse.org/tag/getting-started/)
* [Getting started with Acorn](https://docs.acorn.io/getting-started)
* [Discourse Docker](https://hub.docker.com/r/bitnami/discourse)
