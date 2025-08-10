<?php require_once __DIR__ . '/../config/config.php'; ?>
<?php


    class App {

        
        public $host = HOST;
        public $dbname = DBNAME;
        public $user = USER;
        public $pass = PASS;

        public $link;


         //create a construct 
         
        public function __construct() {

            $this->connect();           
        }


        public function connect() {
            $this->link = new PDO("mysql:host=".$this->host."; dbname=".$this->dbname."",$this->user, $this->pass);

            // if($this->link) {
            //    echo "db connection is working";
            // }

        }


         ###here we are going to create a select all function which will work with our database 
         
         //select all function

         public function selectAll($query) {
            $rows = $this->link->prepare($query);
            $rows->execute();

            $allrows = $rows->fetchAll(PDO::FETCH_OBJ);

            if($allrows) {
                return $allrows;

            } else {

                return false;
            }

        }
    


            // select one function
        public function selectone($query) {

            $row = $this->link->prepare($query);
            $row->execute();

            $singleRow= $row->fetch(PDO::FETCH_OBJ);

            if($singleRow) {

               return $singleRow;
               
            } else {

                return false;
            }

        } 
        
        //NO item allow twince under the (cart) the selection of foods likly by selecting a food 
        
        public function validatecart($q) {

            $row = $this->link->query($q);
            $row->execute();
            $count = $row->rowCount();
            return $count;
        }


        //here we are goinh to Performing CRUD Operations like a funtion where details are puting in

        //insert query  

        public function insert($query, $arr, $path) {

            if($this->validate($arr) == "empty") {
                
                echo "<script>alert('one or more input is empty')</script>";
               
            }else {
                $insert_record = $this->link->prepare($query);
                $insert_record->execute($arr);
                // we are going to set a location inside the header to redirect the user to the page where he is going to see the data that he has just inserted
                   
                // header("location:".$path."");
                echo "<script>window.location.href='".$path."'</script>";

            }

        }

        // HERE other function that we are going to create is the update function which will update the data that is in the database
        //update query
        public function  Update($query, $arr, $path) {

            if ($this->validate($arr) == "empty") {
                
                echo "<script>alert('one or more input is empty')</script>";
               
            }else {
                $update_record = $this->link->prepare($query);
                $update_record->execute($arr);
                // we are going to set a location inside the header to redirect the user to the page where he is going to see the data that he has just inserted
                                   
                
                header("location:".$path."");  
                exit;

            }

        }

        //here we are going to create a delete function which will delete the data that is in the database
        //delete query 

        public function delete($query,  $path) {

            $delete_record = $this->link->query($query);
            $delete_record->execute();

            // we are going to set a location inside the header to redirect the user to the page where he is going to see the data that he has just inserted
                   
            echo "<script>window.location.href='".$path."'</script>";
          

        }
            

        //here we are going to validate the data that is coming from the form 
        //validate data 
        public function validate($arr) {
            foreach($arr as  $value) {
                if(empty(trim($value))) {
                    return "empty";
                }
            }
                
            //if (in_array(" ", $arr)) {

                  //   return "empty";
                //}
                 return "ok";
        }

        //here we are going to be Creating Register and Login Methods 

        public function register($query, $arr, $path) {

            if($this->validate($arr) == "empty") {
             
                echo "<script>alert('one or more input is empty');</script>";
               
            }else {

                $register_user = $this->link->prepare($query);
                $register_user->execute($arr);

                header("Location: $path");
                exit;

            }

        }

        //here we are going to create a login function which will login the user that is in the database
    public function login($query, $data, $path) {
          
       
      //email
         $login_user = $this->link->query($query);
         $login_user->execute();

         $fetch = $login_user->fetch(PDO::FETCH_ASSOC); 

        if ($login_user->rowCount() > 0) {

            //password
            if (password_verify($data['password'], $fetch['password'])) {
                     // ✅ Start session vars

                     $_SESSION['email'] = $fetch['email'];
                     $_SESSION['username'] = $fetch['username'];
                     $_SESSION['user_id'] = $fetch['id'];


                 header("Location: ".$path."");
                 
            } 
        }
    }

            //Starting Sessions
        public function startingSession() {
          if (session_status() === PHP_SESSION_NONE) {
              session_start();
          }

        }


            //validate session
          
        public function validateSession() {
            if(isset($_SESSION['user_id'])) {
                echo "<script>window.location.href='".APPURL."'</script>";
            }
        }

        public function validateSessionAdmin() {
            if(isset($_SESSION['email'])) {
                echo "<script>window.location.href='".ADMINURL."/index.php'</script>";
            }
        }


        public function validateSessionAdminInside() {
            if(!isset($_SESSION['email'])) {
                echo "<script>window.location.href='".ADMINURL."/admins/login-admins.php'</script>";
            }
        }

    
     
    }
          
    

?>