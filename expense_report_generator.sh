#! /bin/bash

# Change the path as it is for you
invoices=/Users/egonsaks/Desktop/expense_report_generator/example_demo_expenses_data/*
# Change the month and currency as needed
month="december"
eur="€"


echo '"Expense item","Cost","Vat"' >  expenses_$month.csv

totalCost=0
totalVat=0

for file in $invoices; do       
  f=$(echo "${file##*/}");
  filename=$(echo $f | rev | cut -f 2- -d '.' | rev);

  name=$(echo $filename | awk -F ' ' '{print $1}');
  cost=$(echo $filename | awk -F ' ' '{print $2}');  
  vat=$(echo $filename | awk -F ' ' '{print $3}');  
  
  costWithoutCurrency=$(echo ${cost:1}); 
  costWithoutCurrency=$(echo ${costWithoutCurrency%?}); 
   
  vatWithoutCurrency=$(echo ${vat:1}); 
  
  totalCost=$(echo "scale=3;$totalCost+$costWithoutCurrency" | bc);
  totalVat=$(echo "scale=3;$totalVat+$vatWithoutCurrency" | bc);

  echo '"'$name'",'$eur$costWithoutCurrency','$eur$vatWithoutCurrency'' >>  expenses_$month.csv
done

echo '" "," "," "' >> expenses_$month.csv
echo '"Total",'$eur$totalCost','$eur$totalVat'' >>  expenses_$month.csv

code=$?
exit $code
