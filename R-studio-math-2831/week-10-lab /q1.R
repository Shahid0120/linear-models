colnames(carsales) <- gsub("^carsales\\$", "", colnames(carsales))

interaction.model <- lm(carsales$RetailSales ~ carsales$GNP + carsales$Increase + carsales$GNP:carsales$Increase)
summary(interaction.model)
# since carsales$GNP:carsales$Increase p-value : 0.7822 > 0.05 accept H0 there is evidecnes for no interaction
# carsales$GNP : p-value =  0.0358 < 0.05 we reject H0 singinciant in model 
# carsales$Increase : p-value = 0.7609>0.05 we accept H0 not-signifncatn
# no singinve of any itneraction between GNP and Increase
no_interaction_model <- lm(carsales$RetailSales ~ carsales$GNP + carsales$Increase)
summary(no_interaction_model)
# carsales$GNP: p-value : 0.0122 <0.05 therefore we reject H0 
# carsales$Increase: p-value:  0.6449 > 0.05 we accept H0 
# no evidecne of increae havcing effect on model

