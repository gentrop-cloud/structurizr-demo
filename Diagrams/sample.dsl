workspace  "Demo"  {

    model {

        customer = person "Customer" "The final customer"
        user = person "User" "Application User"
        gentrop = person "Gentrop" "Admins"

        licenses_database = element "Database" "Licenses Repository"{
                tags "Database"
            }
        conversations_database = element "Database"a "Conversations Repository"{
                tags "Database"
            }


        licenses = softwareSystem "Slack App" {

        }

        appApi = softwareSystem "App API" {

        }


        user -> slackApp "Uses"
        slackApp -> appApi "Uses"

        webApp -> appApi "Uses"
        appApi -> licenses_database
    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
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