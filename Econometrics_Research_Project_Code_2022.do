****   Analyzing Each Country Seprately ****

*** United States of America ***

* Before anything, we need to install "mdesc" package to help us identify missing values
ssc install mdesc

* Now we find how many missing values we have in our data and where
asdoc mdesc, save(USA Data Missing.doc) fs(12)

* Now it's time to fill these missing values using interpolation
ipolate HomicideRate Year, gen (Homicide_New) epolate
drop HomicideRate
gen HomicideRate = Homicide_New
drop Homicide_New

ipolate RobberyRate Year, gen (Robbery_New) epolate
drop RobberyRate
gen RobberyRate = Robbery_New
drop Robbery_New

ipolate GiniIndex Year, gen (Gini_New) epolate
drop GiniIndex
gen GiniIndex = Gini_New
drop Gini_New

* We then use "sum" to get a feeling of our data
asdoc sum GiniIndex RobberyRate HomicideRate Urbanization AverageSchooling GDPGrowth GNIperCapita Year, save(USA Data Summary.doc) fs(12)

* We check if our data has a normal distribution
histogram GNIperCapita, normal name(g1)
histogram GDPGrowth , normal name(g2)
histogram AverageSchooling , normal name(g3)
histogram Urbanization , normal name(g4)
histogram GiniIndex , normal name(g5)
histogram HomicideRate , normal name(g6)
histogram RobberyRate , normal name (g7)
graph combine g1 g2 g3 g4 g5 g6 g7, colfirst

* Since HomicideRate, AverageSchooling and GiniIndex were skewed, we use their natural logarithm for our modelings
gen logHomicideRate = log( HomicideRate )
gen logAverageSchooling = log( AverageSchooling )
gen logGiniIndex = log( GiniIndex )

** First we use HomicideRate as a proxy for crime

* Now it's time to do some regressions! First we visualize the correlation between HomicideRate and GiniIndex
twoway (scatter logHomicideRate logGiniIndex) (lfit logHomicideRate logGiniIndex)

* Now we can do the corresponding regression
asdoc regress logHomicideRate logGiniIndex , save(Homicide Regression USA.doc) fs(12) title(Model One)
outreg2 using RegressionTableUSAh.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress logHomicideRate logGiniIndex GNIperCapita GDPGrowth , save(Homicide Regression USA.doc) fs(12) title(Model Two)
outreg2 using RegressionTableUSAh.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress logHomicideRate logGiniIndex GNIperCapita GDPGrowth logAverageSchooling Urbanization , save(Homicide Regression USA.doc) fs(12) title(Model Three)
outreg2 using RegressionTableUSAh.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress logHomicideRate logGiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress logHomicideRate logGiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress logHomicideRate logGiniIndex GNIperCapita GDPGrowth logAverageSchooling Urbanization 
predict residuals3, resid
histogram residuals3, kdensity normal

** Now we use RobberyRate as a proxy for crime

* First we visualize the correlation between RobberyRate and GiniIndex
twoway (scatter RobberyRate logGiniIndex) (lfit RobberyRate logGiniIndex)

* Now we can do the corresponding regression
asdoc regress RobberyRate logGiniIndex , save(Robbery Regression USA.doc) fs(12) title(Model One)
outreg2 using RegressionTableUSAr.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress RobberyRate logGiniIndex GNIperCapita GDPGrowth , save(Robbery Regression USA.doc) fs(12) title(Model Two)
outreg2 using RegressionTableUSAr.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress RobberyRate logGiniIndex GNIperCapita GDPGrowth logAverageSchooling Urbanization , save(Robbery Regression USA.doc) fs(12) title(Model Three)
outreg2 using RegressionTableUSAr.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress RobberyRate logGiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress RobberyRate logGiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress RobberyRate logGiniIndex GNIperCapita GDPGrowth logAverageSchooling Urbanization 
predict residuals3, resid
histogram residuals3, kdensity normal



*** Mexico ***

* We find how many missing values we have in our data and where
asdoc mdesc, save(Mexico Data Missing.doc) fs(12)

* Now it's time to fill these missing values using interpolation
ipolate RobberyRate Year, gen (Robbery_New) epolate
drop RobberyRate
gen RobberyRate = Robbery_New
drop Robbery_New

ipolate GiniIndex Year, gen (Gini_New) epolate
drop GiniIndex
gen GiniIndex = Gini_New
drop Gini_New

* We then use "sum" to get a feeling of our data
asdoc sum GiniIndex RobberyRate HomicideRate Urbanization AverageSchooling GDPGrowth GNIperCapita Year, save(Mexico Data Summary.doc) fs(12)

* We check if our data has a normal distribution
histogram GNIperCapita, normal name(g1)
histogram GDPGrowth , normal name(g2)
histogram AverageSchooling , normal name(g3)
histogram Urbanization , normal name(g4)
histogram GiniIndex , normal name(g5)
histogram HomicideRate , normal name(g6)
histogram RobberyRate , normal name (g7)
graph combine g1 g2 g3 g4 g5 g6 g7, colfirst

* Since GiniIndex distribution was skewed, we use it's natural logarithm for our modelings
gen logGiniIndex = log( GiniIndex )

** First we use HomicideRate as a proxy for crime

* Now it's time to do some regressions! First we visualize the correlation between HomicideRate and GiniIndex
twoway (scatter HomicideRate logGiniIndex) (lfit HomicideRate logGiniIndex)

* Now we can do the corresponding regression
asdoc regress HomicideRate logGiniIndex , save(Homicide Regression Mexico.doc) fs(12) title(Model One)
outreg2 using RegressionTableMexicoh.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress HomicideRate logGiniIndex GNIperCapita GDPGrowth , save(Homicide Regression Mexico.doc) fs(12) title(Model Two)
outreg2 using RegressionTableMexicoh.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress HomicideRate logGiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization , save(Homicide Regression Mexico.doc) fs(12) title(Model Three)
outreg2 using RegressionTableMexicoh.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress HomicideRate logGiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress HomicideRate logGiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress HomicideRate logGiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization 
predict residuals3, resid
histogram residuals3, kdensity normal

** Now we use RobberyRate as a proxy for crime

* First we visualize the correlation between RobberyRate and GiniIndex
twoway (scatter RobberyRate logGiniIndex) (lfit RobberyRate logGiniIndex)

* Now we can do the corresponding regression
asdoc regress RobberyRate logGiniIndex , save(Robbery Regression Mexico.doc) fs(12) title(Model One)
outreg2 using RegressionTableMexicor.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress RobberyRate logGiniIndex GNIperCapita GDPGrowth , save(Robbery Regression Mexico.doc) fs(12) title(Model Two)
outreg2 using RegressionTableMexicor.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress RobberyRate logGiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization , save(Robbery Regression Mexico.doc) fs(12) title(Model Three)
outreg2 using RegressionTableMexicor.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress RobberyRate logGiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress RobberyRate logGiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress RobberyRate logGiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization 
predict residuals3, resid
histogram residuals3, kdensity normal



*** Brazil ***

* We find how many missing values we have in our data and where
asdoc mdesc, save(Brazil Data Missing.doc) fs(12)

* Now it's time to fill these missing values using interpolation
ipolate RobberyRate Year, gen (Robbery_New) epolate
drop RobberyRate
gen RobberyRate = Robbery_New
drop Robbery_New

ipolate GiniIndex Year, gen (Gini_New) epolate
drop GiniIndex
gen GiniIndex = Gini_New
drop Gini_New

* We then use "sum" to get a feeling of our data
asdoc sum GiniIndex RobberyRate HomicideRate Urbanization AverageSchooling GDPGrowth GNIperCapita Year, save(Brazil Data Summary.doc) fs(12)

* We check if our data has a normal distribution
histogram GNIperCapita, normal name(g1)
histogram GDPGrowth , normal name(g2)
histogram AverageSchooling , normal name(g3)
histogram Urbanization , normal name(g4)
histogram GiniIndex , normal name(g5)
histogram HomicideRate , normal name(g6)
histogram RobberyRate , normal name (g7)
graph combine g1 g2 g3 g4 g5 g6 g7, colfirst

* Since HomicideRate and RobberyRate distributions were skewed, we use their natural logarithms for our modelings
gen logHomicideRate = log( HomicideRate )
gen logRubberyRate = log(RobberyRate)

** First we use HomicideRate as a proxy for crime

* Now it's time to do some regressions! First we visualize the correlation between HomicideRate and GiniIndex
twoway (scatter logHomicideRate GiniIndex) (lfit logHomicideRate GiniIndex)

* Now we can do the corresponding regression
asdoc regress logHomicideRate GiniIndex , save(Homicide Regression Brazil.doc) fs(12) title(Model One)
outreg2 using RegressionTableBrazilh.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress logHomicideRate GiniIndex GNIperCapita GDPGrowth , save(Homicide Regression Brazil.doc) fs(12) title(Model Two)
outreg2 using RegressionTableBrazilh.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress logHomicideRate GiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization , save(Homicide Regression Brazil.doc) fs(12) title(Model Three)
outreg2 using RegressionTableBrazilh.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress logHomicideRate GiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress logHomicideRate GiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress logHomicideRate GiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization 
predict residuals3, resid
histogram residuals3, kdensity normal

** Now we use RobberyRate as a proxy for crime

* First we visualize the correlation between RobberyRate and GiniIndex
twoway (scatter logRubberyRate GiniIndex) (lfit logRubberyRate GiniIndex)

* Now we can do the corresponding regression
asdoc regress logRubberyRate GiniIndex , save(Robbery Regression Brazil.doc) fs(12) title(Model One)
outreg2 using RegressionTableBrazilr.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress logRubberyRate GiniIndex GNIperCapita GDPGrowth , save(Robbery Regression Brazil.doc) fs(12) title(Model Two)
outreg2 using RegressionTableBrazilr.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress logRubberyRate GiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization , save(Robbery Regression Brazil.doc) fs(12) title(Model Three)
outreg2 using RegressionTableBrazilr.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress logRubberyRate GiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress logRubberyRate GiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress logRubberyRate GiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization 
predict residuals3, resid
histogram residuals3, kdensity normal



*** Germany ***

* We find how many missing values we have in our data and where
asdoc mdesc, save(Germany Data Missing.doc) fs(12)

* Now it's time to fill these missing values using interpolation
ipolate RobberyRate Year, gen (Robbery_New) epolate
drop RobberyRate
gen RobberyRate = Robbery_New
drop Robbery_New

ipolate GiniIndex Year, gen (Gini_New) epolate
drop GiniIndex
gen GiniIndex = Gini_New
drop Gini_New

* We then use "sum" to get a feeling of our data
asdoc sum GiniIndex RobberyRate HomicideRate Urbanization AverageSchooling GDPGrowth GNIperCapita Year, save(Germany Data Summary.doc) fs(12)

* We check if our data has a normal distribution
histogram GNIperCapita, normal name(g1)
histogram GDPGrowth , normal name(g2)
histogram AverageSchooling , normal name(g3)
histogram Urbanization , normal name(g4)
histogram GiniIndex , normal name(g5)
histogram HomicideRate , normal name(g6)
histogram RobberyRate , normal name (g7)
graph combine g1 g2 g3 g4 g5 g6 g7, colfirst

* Since AverageSchooling and Urbanization distributions were skewed, we use their natural logarithms for our modelings
gen logAverageSchooling = log( AverageSchooling )
gen logUrbanization = log( Urbanization )

** First we use HomicideRate as a proxy for crime

* Now it's time to do some regressions! First we visualize the correlation between HomicideRate and GiniIndex
twoway (scatter HomicideRate GiniIndex) (lfit HomicideRate GiniIndex)

* Now we can do the corresponding regression
asdoc regress HomicideRate GiniIndex , save(Homicide Regression Germany.doc) fs(12) title(Model One)
outreg2 using RegressionTableGermanyh.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress HomicideRate GiniIndex GNIperCapita GDPGrowth , save(Homicide Regression Germany.doc) fs(12) title(Model Two)
outreg2 using RegressionTableGermanyh.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress HomicideRate GiniIndex GNIperCapita GDPGrowth logAverageSchooling logUrbanization , save(Homicide Regression Germany.doc) fs(12) title(Model Three)
outreg2 using RegressionTableGermanyh.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress HomicideRate GiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress HomicideRate GiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress HomicideRate GiniIndex GNIperCapita GDPGrowth logAverageSchooling logUrbanization 
predict residuals3, resid
histogram residuals3, kdensity normal

** Now we use RobberyRate as a proxy for crime

* First we visualize the correlation between RobberyRate and GiniIndex
twoway (scatter RobberyRate GiniIndex) (lfit RobberyRate GiniIndex)

* Now we can do the corresponding regression
asdoc regress RobberyRate GiniIndex , save(Robbery Regression Germany.doc) fs(12) title(Model One)
outreg2 using RegressionTableGermanyr.doc, ctitle(Model One)

* Now we add some more explanatory variables to build a more reliable model
asdoc regress RobberyRate GiniIndex GNIperCapita GDPGrowth , save(Robbery Regression Germany.doc) fs(12) title(Model Two)
outreg2 using RegressionTableGermanyr.doc, ctitle(Model Two)

* We then add eben more explanatory variables to build a more reliable model
asdoc regress RobberyRate GiniIndex GNIperCapita GDPGrowth logAverageSchooling logUrbanization , save(Robbery Regression Germany.doc) fs(12) title(Model Three)
outreg2 using RegressionTableGermanyr.doc, ctitle(Model Three)

* Now we check if our model's residuals are skewed or not
regress RobberyRate GiniIndex 
predict residuals1, resid
histogram residuals1, kdensity normal

regress RobberyRate GiniIndex GNIperCapita GDPGrowth 
predict residuals2, resid
histogram residuals2, kdensity normal

regress RobberyRate GiniIndex GNIperCapita GDPGrowth logAverageSchooling logUrbanization 
predict residuals3, resid
histogram residuals3, kdensity normal




****   Analyzing Panel Data ****

* First we gotta define our panel data 
xtset CountryCode Year

* We find how many missing values we have in our data and where
asdoc mdesc, save(Panel Data Missing.doc) fs(12)

* Now it's time to fill these missing values using interpolation
ipolate HomicideRate Year, gen (Homicide_New) epolate by (CountryCode)
drop HomicideRate
gen HomicideRate = Homicide_New
drop Homicide_New

ipolate RobberyRate Year, gen (Robbery_New) epolate by (CountryCode)
drop RobberyRate
gen RobberyRate = Robbery_New
drop Robbery_New

ipolate GiniIndex Year, gen (Gini_New) epolate by (CountryCode)
drop GiniIndex
gen GiniIndex = Gini_New
drop Gini_New

ipolate GNIperCapita Year, gen (GNI_New) epolate by (CountryCode)
drop GNIperCapita
gen GNIperCapita = GNI_New
drop GNI_New

* Now we can take a closer look at our panel data
asdoc xtsum CountryCode Year GDPGrowth AverageSchooling Urbanization HomicideRate RobberyRate GiniIndex GNIperCapita, save(Panel Data Info.doc) fs(12)

* It's time to do some regressions! We start with regressing HomicideRate on all explanatory variables
asdoc regress HomicideRate GiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization , save(Homicide Regression Panel.doc) fs(12) title(Panel Model)

* And for our next regression we use RobberyRate instead of Homicide
asdoc regress RobberyRate GiniIndex GNIperCapita GDPGrowth AverageSchooling Urbanization , save(Rubbery Regression Panel.doc) fs(12) title(Panel Model)



**** THE END ****
