# Loan Default Dashboard

### Dashboard Link : https://app.powerbi.com/groups/5317de7d-f5f3-457a-b1ef-20e60cb78eab/dashboards/2a45a871-e887-4850-b87d-25a2d10620ab?experience=power-bi&clientSideAuth=0

## Problem Statement

This dashboard helps the Banks understand their customers better. It helps the banks know if their customers are able to repay the loan amount. Through their banking loan history, they get to know who is worthy for a particular loan, & thus they can reduce their losses of money. It also lets them know that how much amount they should give a person according to the information, thus since by using this dashboard they have identified this problem, they can further work on factors responsible for bearing minimum loss.

So, overall this report and dashboard will show the overview of Loan Amount for Different Categories, Loan Default Rates, and Trends of Loan Amount Change and Default rate Change

Also since loan default rate is fluctuating, they must try to stabilize it.


### Steps followed 

- Step 1 : Establishing Connection Between Microsoft SQL Server and Dataflow Gen 2.
- Step 2 : Bringing data to Power BI Desktop from Dataflow Gen2.
- Step 3 : Open power query editor & in view tab under Data preview section, check "column distribution", "column quality" & "column profile" options.
- Step 4 : Also since by default, profile will be opened only for 1000 rows so you need to select "column profiling based on entire dataset".
- Step 5 : It was observed that in none of the columns errors & empty values were present, So data is already cleaned, save the data in Power Query.
- Step 6 : Now different charts and visual are created using Measures (DAX Functions). Also created calculated columns like Age Groups, Credit Score Bins, Year, Income Bracket.
- Step 7 : The report was then published to Power BI Service.
- Step 8 : Schedule & Incremental Refreshing applied to Dataflow for data to be up to date and Schedule Refreshing applied for Report for latest data reports and charts.

# Snapshot of Dashboard (Power BI Service)

<img width="1919" height="1079" alt="Dashboard Page" src="https://github.com/user-attachments/assets/d448ab1f-2c82-4cdc-b108-ecf8bfdb9812" />
 
# Report Snapshot (Power BI DESKTOP)

<img width="1919" height="1079" alt="Report Page 1" src="https://github.com/user-attachments/assets/7a3b80fd-7144-48e5-be4f-aff7b6251382" />

<img width="1919" height="1079" alt="Report Page 2" src="https://github.com/user-attachments/assets/de8c80df-3e61-4d25-b6a9-19d1bf20abe4" />

<img width="1919" height="1079" alt="Report Page 3" src="https://github.com/user-attachments/assets/5fff39d8-7dc3-448b-b233-1068b669a4ca" />

# Insights

Three page report was created on Power BI Desktop & it was then published to Power BI Service.

Following inferences can be drawn from the dashboard;

### [1] Default Rate for All Loans
- Default Rate by Unemployed = 3.39%
- Default Rate by Part-time = 3.01%
- Default Rate by Self-employed = 2.86%
- Default Rate by Fulltime = 2.36%

        thus, Unemployed people have Higher percentage of loan default.
           
### [2] Average Loan Amount by Age Groups
- Adults = 127.90k
- Middle Age Adults = 127.46k
- Senior Citizens = 127.36k
- Teen = 126.67k
  
        There is no huge difference in loan amount taken by different age groups people  
  
### [3] Total Loans taken by Adults by different Credit Score Groups
- Medium Credit Score = 4.6 billion
- High Credit Score = 4.5 billion
- very Low Credit Score = 2.3 billion
- Low Credit Score = 1.1 billion

        Low Credit Score people given less loan compare to Medium & High Credit Score people, which is fine for less loses as Low Credit Score category people have high chances of loan default

### [4] Average Loan Amount for High Credit Score by Age Groups & Marital Status
- Adults → Single = 128.57k, Married = 128.35k, Divorced = 127.65k
- Middle Age Adults → Single = 128.13k, Married = 126.74k, Divorced = 128.12k
- Senior Citizens → Single = 127.42k, Married = 127.23k, Divorced = 126.92k
- Teen → Single = 128.57k, Married = 124.87k, Divorced = 123.97k

        Loan amounts remain fairly consistent across age groups and marital status, with only slight variations. Single individuals tend to have marginally higher loan amounts in most groups, while teens show comparatively lower values in married and divorced categories.

### [5] Total Loan for Middle Age Adults by Mortgage & Dependents
- Have Mortgage = True → Dependents False = 3.1bn, Dependents True = 3.1bn
- Have Mortgage = False → Dependents False = 3.1bn, Dependents True = 3.1bn

        The total loan amount remains identical across all categories, indicating that neither having a mortgage nor dependents has a noticeable impact on total loan distribution for middle age adults.

        But It shows that half of loan taken having Mortgage and Dependents and vice-versa.

### [6] YTD Loan Amount for different Credit Score Groups & Marital Status
- Medium → Divorced = 673M, Married = 642M, Single = 667M
- High → Divorced = 667M, Married = 661M, Single = 651M
- Very Low → Divorced = 321M, Married = 328M, Single = 358M
- Low → Divorced = 169M, Married = 171M, Single = 169M

        Higher credit score groups (Medium & High) contribute the largest share of loan amounts across all marital statuses. As credit score decreases, the loan amount significantly drops, with only minor variations between married, single, and divorced individuals.

### [7] Total Loan by Income Bracket
- Total Loan Amount = 32.58 billion
    - High Income category = 21.73 Billion
    - Medium Income category = 7.21 Billion
    - Low Income category = 3.63 Billion

        High income individuals contribute the majority of total loan amount, while medium and low income groups account for a significantly smaller share.
