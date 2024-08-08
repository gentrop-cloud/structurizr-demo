workspace {

    model {

        customer = person "Customer" "The final customer"
        user = person "User" "Application User"
        gentrop = person "Gentrop" "Admins"

        slackApp = softwareSystem "Slack App" {
            c1 = container "Container 1"
        }

        backend = softwareSystem "BackendApp" {
            c2 = container "Container 2"
            licenseapi = container "License API" {

            }

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
        webapp -> licenseapi
        customer -> backend
        backend -> customer
        frontend -> licenseapi
        licenseapi -> licenses_database

        slackApp -> backend
    }

    views {

        systemlandscape "SystemLandscape" {
            include *
            exclude webapp
            
        }

        container slackApp {
            include c1 c2
            autoLayout lr
        }
        container frontend {
            include gentrop webapp frontend licenseapi licenses_database
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