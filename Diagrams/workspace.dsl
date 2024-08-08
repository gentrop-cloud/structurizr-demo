workspace {

    model {

        customer = person "Customer" "The final customer"
        user = person "User" "Application User"
        gentrop = person "Gentrop" "Admins"

        slackApp = softwareSystem "Slack App" {
         reports = container "Reports Section" {}   
         licenses = container "Licenses Section" {}   
         incoming = container "Incoming Section" {}   
         outgoing = container "Outgoing Section" {}   

        }

        backend = softwareSystem "BackendApp" {
            licenseapi = container "License API" {
            }
            metricsapi = container "Metrics API"{}

        }
        frontend = softwareSystem "FrontendApp" {
            app = container "Container 2" {
                
            }            
        }
        licenses_database = element "LicenseDatabase" "Licenses Repository"{
                tags "Database"
            }

        conversations_database = element "ConversationDatabase" "Conversations Repository"{
                tags "Database"
            }        


        webapp = element "Browser" "WebApp" {
                    tags "Browser"
                }


        user -> slackApp
        gentrop -> frontend
        gentrop -> webapp
        customer -> backend

        webapp -> licenseapi
        backend -> customer
        frontend -> licenseapi
        
        licenseapi -> licenses_database
        metricsapi -> conversations_database

        slackApp -> backend
    }

    views {

        systemlandscape "SystemLandscape" {
            include *
            exclude webapp
            
        }

        container slackApp {
            include *
        }
        
        container frontend {
            include gentrop webapp frontend licenseapi licenses_database
        }

        container backend {
            include webapp licenseapi licenses_database metricsapi conversations_database
        }


        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
            element "Browser" {
                shape WebBrowser
                background red
            }        
            element "Database"{
                shape Cylinder
                background green
            }    
        }   


    }

}