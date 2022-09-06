# Expense Report Generator

Expense Report Generator for freelancers and small businesses.

Are you spending every month 1-2h just getting your expenses together from receipts for your accountant? If yes then that script helps you to save tons of time. 

Prerequisite:

**File names have to be formated as such:**  *Book_Zero_to_One €30.2, €6.04 vat.pdf* ("*Expense Item*", "*Cost*", "*Vat*", all what's on your receipt)

## How to use that script:

Download the script: expense_report_generator.sh

Edit the path to your expense files/invoices:
```
invoices=/example/your/full/path/to/expenses/*
```

Edit the month and currency as needed:

```
month="December"
eur="€"
```

Make the file executable from terminal:
```
chmod +x expense_report_generator.sh
```

Run it in terminal:
```
./expense_report_generator.sh
```

The output is generated as expenses_month.csv in the same folder where you have expense_report_generator.sh file. CSV file will have "**Expense Item**", "**Cost**", "**Vat**" and "**Total**" fields on it.


<img width="436" alt="Screenshot 2022-08-30 at 13 37 25" src="https://user-images.githubusercontent.com/16326197/187418532-6dc54acf-c209-4ac8-b5db-d3a254787c81.png">

Now you can send that same file over to your accountant without wasting your time consolidating all the expenses manually :)
