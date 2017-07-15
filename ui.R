library(DT)
library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
    dashboardHeader(title = "My Dashboard"),
    dashboardSidebar(
        
        sidebarUserPanel("Mike Ghoul",
                         image = "https://yt3.ggpht.com/-04uuTMHfDz4/AAAAAAAAAAI/AAAAAAAAAAA/Kjeupp-eNNg/s100-c-k-no-rj-c0xffffff/photo.jpg"),
        sidebarMenu(
            menuItem('Graph', tabName = 'graph', icon = icon('bar-chart')),
            menuItem("Region View", tabName = "region", icon = icon("map")),
            menuItem("Data", tabName = "data", icon = icon("database"))
        )),

    dashboardBody(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
        ),
        tabItems(
            tabItem(tabName = "region",
                    fluidRow(box(title = 'Selections',
                                 
                                 selectizeInput("selected",
                                                "Select Item to Display",
                                                choice),
                                 
                                 sliderInput("Year", "Year", 
                                             min = 1977, max = 2016, value = 1990, step= 1)
                                 
                                 )),
                    fluidRow(box(htmlOutput("region"), height = 300, width = 500))),
                             # box(htmlOutput("hist"), height = 300))),
            tabItem(tabName = "data",
                    fluidRow(box(DT::dataTableOutput("table"), width = 12))),
            
            tabItem(tabName = 'graph',
                    fluidRow(title = 'Selections',
                                 selectizeInput("selected2",
                                                "Select Item to Display",
                                                c('Cumulative drop-out rate (both sexes %)' = 'Cum_drop_both',
                                                   'Cumulative drop-out rate (female %)' =  'Cum_drop_f', 
                                                   'Cumulative drop-out rate (male %)' ='Cum_drop_m', 
                                                   'Expenditure on education (% of total govt expenditure)' = 'Exp_ed_tot_gov',
                                                   'Expenditure on primary ed (% of total ed expenditure)' = 'Exp_prim_ed_tot_ed',
                                                   'Expenditure on primary ed (% of total govt expenditure)' = 'Exp_prim_ed_tot_govt', 
                                                   'GNI per capita (Atlas)' = 'GNI_per_capita_Atlas',
                                                   'GNI per capita (PPP)' = 'GNI_per_capitaPPP', 
                                                   'Govt expenditure on ed (% of GDP)' = 'Govt_exp_%_GDP', 
                                                   'Govt expenditure on primary ed (% of GDP)' = 'Govt_exp_prim_ed_%_GDP',
                                                   'Gross enrollment ratio (both sexes %)' = 'Gross_enr_ratio_both%', 
                                                   'Gross enrollment ratio (female %)' = 'Gross_enr_ratio_f%', 
                                                   'Gross enrollment ratio (gender parity index)' = 'Gross_enr_ratio_gpi', 
                                                   'Gross enrollment ratio (male %)' = 'Gross_enr_ratio_m%)', 
                                                   'Literacy rate, pop 25-64 years, both sexes (%)'= 'Lit_rate_pop_25-64_both%',
                                                   'Literacy rate, pop 25-64 years, female (%)'= 'Lit_rate_pop_25-64_f%',
                                                   'Literacy rate, population 25-64 years, gender parity index (GPI)' = 'Lit_rate_pop_25-64_GPI',
                                                   'Literacy rate, pop 25-64 years, male (%)' = 'Lit_rate_pop_25-64_m%',
                                                   'Pupil-teacher ratio (headcount)' = 'Pupil_teach_ratio', 
                                                   'Pupil/qualified teacher ratio (headcount)' = 'Pupil_qual_teach_ratio',
                                                   'Unemployment female (% of female labor force)' = 'Unem_f', 
                                                   'Unemployment male (% of male labor force)' = 'Unem_m',
                                                   'Unemployment total (% of total labor force)'= 'Unem_t')),
                                    
                                                
                             fluidRow(plotlyOutput('graph'), height = 800, width = "100%")
                                                                                          ))
                                 
       )
        )
    )
    )
