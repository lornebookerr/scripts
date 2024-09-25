# Config 
$SchoolName = "Crofton School"
$Domain = "DC=curriculum,DC=crofton,DC=hants,DC=sch,DC=uk" 

# Create Top level OUs
New-ADOrganizationalUnit "$SchoolName" -Description "LBT - Windows 10"
New-ADOrganizationalUnit "Servers"
New-ADOrganizationalUnit "Computers" -Path "OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Groups" -Path "OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Users" -Path "OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Hyper-V" -Path "OU=Servers,$Domain"
New-ADOrganizationalUnit "RDS" -Path "OU=Servers,$Domain"

# Create Computer OUs
New-ADOrganizationalUnit "Misc" -Path "OU=Computers,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Staff" -Path "OU=Computers,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Students" -Path "OU=Computers,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "TV Screens" -Path "OU=Misc,OU=Computers,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Desktops" -Path "OU=Staff,OU=Computers,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Laptops" -Path "OU=Staff,OU=Computers,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Desktops" -Path "OU=Students,OU=Computers,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Laptops" -Path "OU=Students,OU=Computers,OU=$SchoolName,$Domain"

# Create Groups OUs
New-ADOrganizationalUnit "Distribution Groups" -Path "OU=Groups,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Mapped Drives" -Path "OU=Groups,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Security Groups" -Path "OU=Groups,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Staff" -Path "OU=Security Groups,OU=Groups,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Student" -Path "OU=Security Groups,OU=Groups,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Wireless" -Path "OU=Security Groups,OU=Groups,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Departments" -Path "OU=Staff,OU=Security Groups,OU=Groups,OU=$SchoolName,$Domain"

# Create User OUs
New-ADOrganizationalUnit "Misc" -Path "OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Staff" -Path "OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Students" -Path "OU=Users,OU=$SchoolName,$Domain"

# Create Misc User OUs
New-ADOrganizationalUnit "Administrators" -Path "OU=Misc,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Contacts" -Path "OU=Misc,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Guests" -Path "OU=Misc,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Mailboxes" -Path "OU=Misc,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Service Accounts" -Path "OU=Misc,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Wireless Devices" -Path "OU=Misc,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Governors" -Path "OU=Misc,OU=Users,OU=$SchoolName,$Domain"

# Create Staff User OUs
New-ADOrganizationalUnit "Non-Teaching Staff" -Path "OU=Staff,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Teaching Staff" -Path "OU=Staff,OU=Users,OU=$SchoolName,$Domain"

# Create Student User OUs

New-ADOrganizationalUnit "Exams" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain"
New-ADOrganizationalUnit "Intake 2021" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain" -Description "Year 7"
New-ADOrganizationalUnit "Intake 2020" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain" -Description "Year 8"
New-ADOrganizationalUnit "Intake 2019" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain" -Description "Year 9"
New-ADOrganizationalUnit "Intake 2018" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain" -Description "Year 10"
New-ADOrganizationalUnit "Intake 2017" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain" -Description "Year 11"
New-ADOrganizationalUnit "Intake 2016" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain" -Description "Leavers - July 21"
New-ADOrganizationalUnit "Intake 2015" -Path "OU=Students,OU=Users,OU=$SchoolName,$Domain" -Description "Leavers - July 20"