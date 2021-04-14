module.exports = {
    "environment": process.env.NODE_ENV || 'production',

    "connections": {
        "appdev_default": {
            "host": "db",
            "port": 3306,
            "user": "root",
            "password": "root",
            "database": "site"
        },
        "appBuilder": {
            "database": "appbuilder"
        }
    },
    "datastores": {
        "appbuilder": {
            "adapter": "sails-mysql",
            "host": "db",
            "port": 3306,
            "user": "root",
            "password": null,
            "database": "appbuilder"
        },
        "site": {
            "adapter": "sails-mysql",
            "host": "db",
            "port": 3306,
            "user": "root",
            "password": null,
            "database": "site"
        }
    },

    "nodemailer": {
        "default": "smtp",
        "smtp": {
            "type": "SMTP",
            "host": "SMTP.HOST.ADDR",
            "secureConnection": false,
            "port": 25
        }
    },
    "notification_email": {
        "enable": false,
        "default": "smtp",
        "smtp": {}
    },

    "appbuilder": {
        "baseURL": "http://localhost:1337",
        "deeplink": null,
        "mcc": {
            "enabled": false,
            "url": "http://localhost:1337",
            "accessToken": "",
            "pollFrequency": 5000,
            "maxPacketSize": 1048576
        },
        "pathFiles": "data/app_builder",
        "graphDB": {
            "url": "http://127.0.0.1:8529",
            "databaseName": "appBuilder",
            "user": "",
            "pass": ""
        }
    },
    "crontab": {},
    "process_manager": {
        "enable": true
    }
}