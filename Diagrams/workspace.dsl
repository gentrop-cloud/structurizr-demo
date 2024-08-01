workspace  "Demo"  {

    model {
        admin = person "Gentrop" "The Gentrop team to manage the licenses"
        user = person "User" "Application User"

        slackApp = softwareSystem "Slack App"
        appApi = softwareSystem "API App" {
        }
        appPortal = softwareSystem "AppPortal" {
            webApp = container "Web Application" {
                web = component "Web Browser"{
                    tags "Browser"
                }
            }
        }
        licenses_database = element "Database" "Licenses Repository"{
                tags "Database"
            }
        
        user -> slackApp "Uses"
        admin -> appPortal "Uses"

        webApp -> appApi "Uses"
        slackApp -> appApi "Uses"
        appApi -> licenses_database
    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext appPortal {
            include *
            description "The system context diagram for the API application."
        }

        container appPortal {
            include *
        }

        component webApp {
            include *
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