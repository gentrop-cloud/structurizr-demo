workspace  "Demo"  {

    model {
        admin = person "Gentrop" "The Gentrop team to manage the licenses"
        user = person "User" "Application User"
        

        slackApp = softwareSystem "Slack App" "The Slack Application" 
        appPortal = softwareSystem "App Pages" "The frontend for admins" {
              db = container "Database Schema" {
                tags "Database"
            }
        }
        appApi = softwareSystem "API App" "The API application"

        user -> slackApp "Uses"
        admin -> appPortal "Uses"
        appPortal -> appApi "Uses"
        slackApp -> appApi "Uses"
    }

    views {
        systemLandscape  "SystemLandscape" {
            include *
            
        }

        container appPortal "DiagramaPortal" {
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
        }
    }
    
}