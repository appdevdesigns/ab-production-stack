# ab-production-stack
Base files for setting up an instance of the AppBuilder docker production stack


## Instructions

### docker-compose.yml

  Mainly, you will want to edit this to expose ports from the Docker containers
  to be accessible from the outside via your own external port number.

#### **Required**
  - api_sails:
    - ports:
        - "*[external port]*:1337"

#### **Recommended**
  - db:
    - ports:
        - "*[external port]*:3306"


### Config

  There are two config files that the AppBuilder stack will rely on.
  Make sure to edit them with your own settings *before* starting up 
  AppBuilder.

1. **./config/local.js**

    This is roughly in the JSON format. You may recognize it as the main config
    file used by Sails. However, other components of the AppBuilder stack will
    also be using this one. The main settings you will typically want to change 
    are:
  
    * **connections.appdev_default.password**
    
      This is the root password to your stack's MariaDB database. This will 
      automatically be adjusted to have the same value as the `./mysql/password` 
      file below. There is no need to change any setting in this section.
    
    * **connections.appBuilder**
    
      No need to change this.
    
    * **nodemailer.smtp.host**
    
      This is the domain name for your outgoing mail server. AppBuilder will use 
      this when sending out notification emails.
    
    * **appbuilder.baseURL**
    
      The external URL that users will use to access this AppBuilder site.
    
    * **appbuilder.mcc**
    
      The public facing secure relay server that this AppBuilder instance 
      will connect with. You can safely leave this disabled.

2. **./mysql/password**

    This is a plaintext file. Its value will be used to fill
    the `appdev_default.password` setting from `./config/local.js`.
    
    Important note: When you start up the MariaDB container in this AppBuilder 
    stack for the first time, it will set the database root password to the
    value you have specified in this password file. After that first time, 
    changing this value will not affect the already established password.
    
    If your database is already set up, this password file must still be
    entered correctly as it will automatically be replicated into the 
    `./config/local.js` file.


### Data

  * **./mysql/data**

    This is where the MariaDB server will save its data. Do not manually edit
    files from here unless you really know what you are doing. If you want to
    start from scratch again and discard all existing data, you can delete the
    contents of this directory.

  * **./mysql/init**

    The SQL files contained here will be used to populate the database for the
    first time.

  * **./redis/data**

    This is where the redis server will save its data.

  * **./data**

    This is where the main AppBuilder Sails component will store any files uploaded
    by users.


## Usage

### Preparation

  Please follow the **Instructions** section on configuring your DB credentials
  and other settings. Then, run `$ docker swarm init` to enable the Docker 
  stack feature.
    
  In order to issue Docker commands, your account must either have root access,
  or be part of the *docker* group.

### Start AppBuilder

```sh
$ docker stack deploy -c docker-compose.yml [STACK_NAME]
```
  Substitute your desired text for `[STACK_NAME]`. This is used to help
  differentiate it from any other stacks running on the same server.

### Stop AppBuilder

```sh
$ docker stack rm [STACK_NAME]
```

### View console

```sh
$ docker service logs -f [STACK_NAME]_api_sails
```

