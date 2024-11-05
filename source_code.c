#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>
struct election         // Define a structure named 'election'
{
    char cons[20];
    char date[20];
};

struct candidate      //structure named 'candidate'
{
    int sno;
    char name[20]; 
    char party[20];
    char from[20];
};

struct voter             //structure named 'voter'
 {
    int sno;
    char name[100];
    char address[100];
    char password[6];
};
void printline();          //function prototype with no argument and no return type
void election_schedule(); 
void schedule_add(); 
void schedule_view();
void candidate_reg(); 
void candidate_add();
void candidate_update();
void candidate_delete();
void candidate_view();
void voter_reg();
void vote_cast1();  
void final();
int main()               
{                        //the main program will run
    int data;
    menu:
    printf("\xB2\xB2\xB2\xB2\xB2\xB2\xB2\xB2\xB2\xB2\xB2\tWELCOME TO VOTING SYSTEM\t\xB2\xB2\xB2\xB2\xB2\xB2\xB2\xB2\xB2");
    printf("\n");
    printf("\n1.Election Schedule");
    printf("\n2.Candidate Registration");
    printf("\n3.Voter Registration");
    printf("\n4.Cast The Vote");
    printf("\n5.View Result");
    printf("\n6.Exit");
    printf("\n\t\tEnter Your Choice:");

    scanf("%d",&data);
    switch(data)
    {
    case 1:
           election_schedule();
            goto menu;
           
    case 2:
           candidate_reg();
             goto menu;
          
    case 3:
           voter_reg();
           goto menu;
         
    case 4:
    	vote_cast1();
    	break;
 
    case 5:
    	final();
    	break;
    
    case 6:
        	break;
    default:
        		printf("\n\t\tThe option is not available");
    }
    return 0;
}

void printline()     //contains no argument
    {
           printf("===========================================================================================================\n");  
    }


    void election_schedule()
    {
    	struct election s1[77];
    	system("cls");
          int ch;           //variable for switch switch
		  back:          //goto label
         printline();           
         printf("\nElection Schedule Page\n");
         printline();                          
         printf("\n 1.Add");
         printf("\n 2.View");
         printf("\n 3.Exit");
         printf("\n\t\tEnter your Option:");
         scanf("%d",&ch);
         switch(ch)               //switch case
         {
         	case 1:
         		system("cls");
         		schedule_add();
         	    goto back;
         	case 2:
         		system("cls");
         		schedule_view();
         		goto back;
         	case 3:
         		system("cls");
         		break;
         	default:
         	    	printf("\n\t\tThe option is not available\n");
         	    
         }
     }
         
void schedule_add()
{
	    struct election s1[77];
	    system("cls");
	    char admin[20];            // define variables for admin login
         char password[20];
        
          FILE * point;        //for file
          int i=0,n;
             password:       //label  
             printline();      // display login 
             printf("Log In\n");
             printline();  
              printf("\nAdmin Name:");
             scanf("%s",&admin);
               printf("\nEnter Password:");
              scanf("%s",&password);
                     
          if(strcmp(admin,"Nirjala")==0 && strcmp(password,"500pass")==0)     // check if login is correct
         {
         	system("cls");
              printline();
              printf("Login Successfully\n");             // display success message
              printline();
              point=fopen("Schedule_File.txt","a");          // open file for appending data
              printf("How many Constituency You want to enter:");
              scanf("%d",&n);
              for(i=0;i<n;i++)  // loop through and add details for each constituency
              {
                printf("\nConstituency:");
                scanf("%s",s1[i].cons);
                printf("\n Date(yyyymmdd in BS):");
                scanf("%s",s1[i].date);
               fprintf(point,"%s\t\t%s\n",s1[i].cons,s1[i].date);
              }
              printf("\n\t\tSuccessfully Added\n");
              fclose(point);   // display success message and close file
}
else
{
printf("\nCheck Admin name & Password\n");	
}
}

void schedule_view()
{
	   struct election s1[77];
	FILE * point;
	int i=0;
	    system("cls");
        point=fopen("Schedule_File.txt","r");
        if(point == NULL)
        {
            printf("\n Error Opening the File \n");
            return;
        }
        printline();
        printf("\n Constituency\t\tDate(yyyymmdd)\n");
        printline();
        while(fscanf(point,"%s\t\t%s\n",&s1[i].cons,&s1[i].date)!=EOF)  //program wil continue till end of file
        {
            printf("%-15s\t||\t%-15s\n",s1[i].cons,s1[i].date);
        }
        printline();
        fclose(point);
}

 void candidate_reg()     //for candidate registration
         {
        struct candidate s2[500];
         system("cls");
         char admin[20];
         char password[20];
         int ch,ch1;  //for switch     
         int i=0,n;       //for loop and the number of names that is required
         printline();
         printf("\nCandidate Registration Page\n");
         printline();
         forward:
         printf("\n 1.Add, Update and Delete(Only Admin)");
         printf("\n 2.View");
         printf("\n 3.Exit");
         printf("\n\t\tEnter your choice:");
         scanf("%d",&ch);
         switch(ch)
         {
            case 1:
             system("cls");
             password:       //label  
             printline(); 
             printf("Log In\n");
             printline();  
              printf("\nAdmin Name:");
             scanf("%s",&admin);
               printf("\nEnter Password:");
              scanf("%s",&password);
              if(strcmp(admin,"Nirjala")==0 && strcmp(password,"500pass")==0)
              {
              	system("cls");
                printf("Login Successfully\n");
                again:
                printline();
                printf("\nAdmin Menu\n");
                printline();
                printf("\n 1.Add");
                printf("\n 2.Update");
                printf("\n 3.Delete");
                printf("\n 4.Exit");
                printf("\n\t\tChoose Your Option:");
                scanf("%d",&ch1);
                switch(ch1)               //switch for add, update and delete
                {
                 case 1:
                 	system("cls");
                    candidate_add();
                   goto again;
                case 2:
                	system("cls");
                       	candidate_update();
                  	    goto again;
                  	    
                 case 3:
                 		system("cls");
                  		candidate_delete();
                  		goto again;
                case 4:
                		system("cls");
                  		goto forward;
                  		
                 default:
                 		system("cls");
                 	printf("\n\t\tThat option doesnot exit\n");
                 	goto again;
                }
              }
                else
              {
              	        system("cls");
                       printf("!!\nLogin Failed\n!!");
                       goto password; 
              }
    case 2:
    		system("cls");
              	candidate_view();
              	goto forward;
              	
    case 3:          
                    system("cls");
              		break;
    default:
              			printf("\n\t\tThe option is not available");
     }
    }
    void candidate_add()
    {
    	          struct candidate s2[500];
    	          system("cls");
				  FILE * point;
                    int n,i=0;
				   system("cls");         //to add the information
                   point=fopen("Candidate_List.txt","a");
                   printf("\nHow many details you want to add:");
                   scanf("%d",&n);
                   for(i=0;i<n;i++)
                   {

                      printf("\nSerial No:");
                     scanf("%d",&s2[i].sno);

                       printf("\nCandidate Name:");
                       scanf("%s",s2[i].name);

                       printf("\nPolitical Party:");
                       scanf("%s",s2[i].party);

                       printf("\nCandidacy From:");
                       scanf("%s",s2[i].from);

                       fprintf(point,"\n%d\t\t%s\t\t%s\t\t%s\n",s2[i].sno,s2[i].name,s2[i].party,s2[i].from);
                   }
                   printf("\n\t\tSuccessfully Added\n");
                   fclose(point);
	}

void candidate_update()
{
	struct candidate s2[500];
	system("cls");
	int snum;
	char line[100],sno[10],newname[20],newparty[20],newfrom[20];
	printf("\nEnter Symbol Number of candidate you want to update:");
	scanf("%d",&snum);
	sprintf(sno,"%d",snum);
	
	printf("\n\tNew candidate name: ");
    scanf("%s",newname);
    
  printf("\n\tNew political party: ");
  scanf("%s", newparty);

  printf("\n\tNew candidancy from: ");
  scanf("%s",newfrom);
  
  FILE *point,*point2;
	point = fopen("Candidate_List.txt", "r");
    point2 = fopen("random.txt", "w");
    while (fgets(line, sizeof(line), point))
	{
    if (strstr(line, sno)) 
	{ 
    fprintf(point2,"%d\t\t%s\t\t%s\t\t%s\n",snum,newname,newparty,newfrom); // write the updated line to the temporary file
    }
	else 
	{
      fputs(line,point2);// write the line as is to the temporary file
    }
}
printf("\n\tDetails Successfully Updated\n");
  fclose(point);
  fclose(point2);
 remove("Candidate_List.txt");
 rename("random.txt","Candidate_List.txt");
}

void candidate_delete()
{
	struct candidate s2[500];
	system("cls");
	FILE *point,*point2;
 	int snum;
	char line[100],sno[10];
	printf("\nEnter Symbol Number of candidate you want to delete:");
	scanf("%d",&snum);
	sprintf(sno,"%d",snum);
	
// read the file line by line and skip writing lines with the name of the candidate to be deleted to the temporary file
  point= fopen("Candidate_List.txt", "r");
  point2= fopen("random.txt", "w");
  
  while (fgets(line, sizeof(line),point))
   {
    if (!strstr(line, sno))        // if the name does not appear in the line
	 {                       
      fprintf(point2, "%s", line);  // write the line to the temporary file
    }
  }
  printf("\n\t\tDetail Successfully Deleted\n");
  fclose(point);
  fclose(point2);
  remove("Candidate_List.txt");               // delete the original file
  rename("random.txt", "Candidate_List.txt");  // rename the temporary file
}

void candidate_view()
{
	struct candidate s2[500];
	system("cls");
  char line[100];	
 printf("\nCandidate List\n");
 printline();
  printf("\nSymbol.No\tName\t\t\tPolitical Party\t\tCandidacy From\n");
  printline();

  // read the file line by line and print each line
  FILE * point = fopen("Candidate_List.txt", "r");
  while (fgets(line, sizeof(line),point))
  {
    printf("%10s", line);
  }
  fclose(point);	

}

void voter_reg()
{
	struct voter s3[500];
	system("cls");
    int ch,age,year,month,day;
     int n, i;
     char lookname[100];
     forward:
     printline();
     printf("Voter Registration Page\n");
     printline();
    printf("\n1. Add");
    printf("\n2. View");
    printf("\n3. Search");
    printf("\n4. Update");
    printf("\n5. Exit");
    printf("\n\t\tEnter your choice: ");
    scanf("%d", &ch);
    switch(ch)
    {
 case 1:
     system("cls");
     int a=0,serial_number = 1; 
     char linebyline[100];
    printf("How many You want:");
    scanf("%d", &n);
    FILE *fp3 =fopen("Voter_List.txt", "r");
    while(fgets(linebyline,sizeof(linebyline),fp3))
    {
    	a++;
	}
	a=a/2;
    fclose(fp3);
    serial_number=serial_number+a;
    fp3 =fopen("Voter_List.txt", "a");
    if (fp3 == NULL) 
    {
        printf("Error opening file!\n");
        return;
    }
    
     //  to store serial number

    for (i = 0; i < n; i++) 
    {
        printf("\nName:");
        scanf("%s", s3[i].name);
        
        printf("\nDOB in year:");
        scanf("%d", &year);
        
         printf("\nDOB in month:");
        scanf("%d", &month);
        
         printf("\nDOB in day:");
        scanf("%d", &day);
        
        printf("\nAddress:");
        scanf("%s",s3[i].address);
        
        printf("\nPassword:");
        scanf("%s", s3[i].password);
        
        s3[i].sno = serial_number++;  
		// assign serial number and increment                         
        
        // Write voter structure to file
        age=2079-year;
        if(age>18)
        {
         fprintf(fp3,"\n%d\t\t%s\t\t%d%d%d\t\t%s\t\t%s\n",s3[i].sno, s3[i].name,year,month,day,s3[i].address,s3[i].password);

		}
		else
		{
			printf("\n\nCheck age again\n");
		goto forward;	
		}
       
    }
    printf("\n\t\t Details Added Successufully\n");
    fclose(fp3);
     goto forward;
 break;
 
 case 2:
 	system("cls");
    // Open file for reading
    fp3 = fopen("Voter_List.txt", "r");
    if (fp3 == NULL) 
    {
        printf("Error opening file!\n");
        return;
    }

    // Read and print voter data from file
printline();
printf("\nSN\tName\tDOB(yyyy/m/d)\t\t\tAddress\t\tPassword\n");
printline();
    while(fscanf(fp3,"%d%s%d%s%s",&s3[i].sno,s3[i].name,&year,s3[i].address,s3[i].password)!=EOF)
    {
        printf("%-10d%-15s%-15d\t%5s\t%15s\n", s3[i].sno, s3[i].name,year ,s3[i].address, s3[i].password);
        i++;
    }
   printline();
fclose(fp3);
 goto forward;
 break;
 
 
 case 3:
 	system("cls");
    printf("Enter name to search: ");
    scanf("%s", lookname);

    // Open file for reading
    fp3 = fopen("Voter_List.txt", "r");
    if (fp3 == NULL) {
        printf("Error opening file!\n");
        return;
    }

      while(fscanf(fp3,"%d%s%d%s%s",&s3[i].sno, s3[i].name,&year,s3[i].address,s3[i].password)!=EOF)
	    // Read and print voter data from file
   
    {
        if (strcmp(s3[i].name, lookname) == 0) 
        {
        	printline();
            printf("\nSerial Number: %d", s3[i].sno);
            printf("\nName: %s", s3[i].name);
            printf("\nDOB(yyyymmdd): %d", year);
            printf("\nAddress: %s\n", s3[i].address);
            printf("\nPassword: %s\n", s3[i].password);
            printf("\n");
            printline();
        }
    }

    fclose(fp3);
     goto forward;
 break;
 case 4:
 system("cls");
 	int snum;
	char line[100],sno[10],newname[20],newadd[50],newpass[6];
	int newyear,newmonth,newday;
	printf("\nEnter Symbol Number of candidate you want to update:");
	scanf("%d",&snum);
	sprintf(sno,"%d",snum);
	
	printf("\n\tUpdate name: ");
    scanf("%s",newname);
    
  printf("\n\tUpdate Year : ");
  scanf("%d", &newyear);

  printf("\n\tUpdate Month: ");
  scanf("%d",&newmonth);
  
  printf("\n\tUpdate day: ");
  scanf("%d",&newday);
  
   printf("\n\tUpdate Address: ");
  scanf("%s",&newadd);
  
   printf("\n\tUpdate Password: ");
  scanf("%s",&newpass);
  age=2079-newyear;
  FILE *point,*rand;
	point = fopen("Voter_List.txt", "r");
    rand = fopen("random.txt", "w");
    while (fgets(line, sizeof(line), point))
	{
    if (strstr(line, sno)&&age>18) 
	{ 
    fprintf(rand,"%d\t\t%s\t\t%d%d%d\t\t%s\t\t%s\n",snum,newname,newyear,newmonth,newday,newadd,newpass); // write the updated line to the temporary file
    }
	else 
	{
      fputs(line,rand);// write the line as is to the temporary file
    }
}
printf("\n\tDetails Successfully Updated\n");
  fclose(point);
  fclose(rand);
 remove("Voter_List.txt");
 rename("random.txt","Voter_List.txt");
 	
 default:
 printf("\nCheck Age again!!\n");
    }
}

void vote_cast1()
{
    struct voter s3[500];
    struct candidate s2[500];
    printline();
    printf("\n\tVoting Panel\n");
    printline();
    int year, i, votersn, cast;
    char password[6];
    printf("\nEnter your Voter Symbol Number:");
    scanf("%d", &votersn);
    printf("\nEnter Your Password:");
    scanf("%s", password);
    FILE *check = fopen("Voter_List.txt", "r");
    FILE * check2 = fopen("Candidate_List.txt", "r");
    if (check == NULL)
    {
        printf("\n\t\tYour Voter number does not match with the password\n");
        return;
    }
    i = 0;
    while (fscanf(check, "%d%s%d%s%s", &s3[i].sno, s3[i].name, &year, s3[i].address, s3[i].password) != EOF)
    {
        if (s3[i].sno == votersn && strcmp(s3[i].password, password) == 0)
        {
           printline();
           printf("\nName\t\tPolitical Party\t\tCandidancy From\n");
           printline();
            while (fscanf(check2,"%d%s%s%s",&s2[i].sno,s2[i].name,s2[i].party,s2[i].from) != EOF)
            {
            	printf("\n%s\t\t%s\t\t%s\n",&s2[i].name,s2[i].party,s2[i].from);
			}
            printf("\n\n\t\tCast Your Vote (according to order):");
            scanf("%d", &cast);
            fclose(check2);
            FILE *check2 = fopen("Candidate_List.txt", "r");
            if (check2 == NULL)
			 {
                printf("\nSorry, Candidate list not found\n");
                return;
              }
            int numcan1 = 0;
            while (fscanf(check2,"%d%s%s%s",&s2[i].sno,s2[i].name,s2[i].party,s2[i].from) != EOF) 
			{
                numcan1++;
          }
            fclose(check2);
            if (cast < 1 || cast > numcan1)
			 {
                printf("\nInvalid candidate number\n");
                return;
            }
            FILE *point, *point2;
           int a = 0;
           int vcount[numcan1];
           point = fopen("VoterCount_List.txt", "r");
           if (point == NULL)
           {
                point2 = fopen("Candidate_List.txt", "r");
                point = fopen("VoterCount_List.txt", "w");
               while (fscanf(point2,"%d%s%s%s",&s2[a].sno,s2[a].name,s2[a].party,s2[a].from) != EOF)
                {
                	vcount[a]=0;
                    fprintf(point, "%s\t%d\n", s2[a].name, vcount[a]);
                    a++;
                }
                fclose(point);
                fclose(point2);
            }
            else
            {
            fclose(point);	
			}
            point = fopen("VoterCount_List.txt", "r");
            int numcan2 = 0;
            while (fscanf(point, "%s%d", s3[numcan2].name, &vcount[numcan2]) != EOF)
            {
                numcan2++;
            }
            fclose(point);
            vcount[cast - 1]++;              // increment the vote count for the selected candidate
            point = fopen("VoterCount_List.txt", "w");
            for ( i = 0; i <numcan2; i++)
            {
                fprintf(point, "%s %d\n", s3[i].name, vcount[i]);
            }
            fclose(point);
            printf("\n\t\tSuccessfully Cast Your Vote\n");
            return;
        }
        i++;
    }
    printf("\n\t\tYour Voter number does not match with the password\n");
    fclose(check);
    
}
void final()
 {
    FILE *point;
    struct candidate s2[500];
    int i = 0;
    int numcan = 0;
    int vcount[10] = {0};
    int hvote = 0, win = -1; // set win to -1 to handle the case where no votes have been cast yet
    point = fopen("VoterCount_List.txt", "r");
    if (point == NULL)
    {
        printf("\nNo votes have been cast yet.\n");
        return;
    }
    while (fscanf(point, "%s %d", s2[i].name, &vcount[i]) != EOF) {
        i++;
    }
    numcan = i; // set numcan to the actual number of candidates
    fclose(point);

    if (numcan == 0)
    {
        printf("\nNot any votes have been cast yet\n");
        return;
    }

    // Load candidate data from file
    point = fopen("Candidate_List.txt", "r");
    if (point == NULL) 
	{
        printf("\nSorry, Candidate list not found\n");
        return;
    }
    i = 0;
    while (fscanf(point, "%d %s %s %s", &s2[i].sno, s2[i].name, s2[i].party, s2[i].from) != EOF)
   {
        i++;
    }
    fclose(point);

    printline();
    printf("\n\t\tCandidate\t\tParty\t\tTotal Votes Received\n");
    printline();
    for (i = 0; i < numcan; i++) 
	{
        printf("\t\t%5s\t\t%5s\t\t%5d\n", s2[i].name, s2[i].party, vcount[i]);
        if (vcount[i] > hvote) 
		{
            hvote = vcount[i];
            win = i;
        }
    }

    if (win != -1)
	 {
        printf("\n\t\tName Of Winner: %s\n", s2[win].name);
    } else 
	{
        printf("\n\t\tNo votes have been cast yet.\n");
    }
}




         
         

           

         
