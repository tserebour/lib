<?php

class Customer{
    
    public $response = "";

   public $id = 0;
   public $name = "";
   public $username = "";
   public $password = "";
   public $confirm_password = "";
    
   public $lastname = "";
   public $address = "";
   public $email = "";
   public $phone = "";   

}


session_start();
$conn = mysqli_connect('localhost','root','','laundry');


    
    
    
    
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    if(empty($username) || empty($password)){
        echo 'empty';
        
//        header("Location: /pharmacy/?error=emptyfields");
        exit();
    }else{
        
        $sql = "SELECT * FROM laundry.customers where username = '$username';";
        
        $query = mysqli_query($conn, $sql);
        
        $result = mysqli_num_rows($query);
        
        
        if($result > 0){
            
            $row = mysqli_fetch_assoc($query);
            $upassword = $row['password'];
            
            $passwordverify = password_verify($password,$upassword);
//            
//            
            if(!$passwordverify){
                echo 'incorrect password';
                
                
//                header("Location: /pharmacy/?error=wronginput");
                exit();
                
            }else{
                
                
                $_SESSION['id'] = $row['id'];
                $_SESSION['name'] = $row['firstname'];
                $_SESSION['username'] = $row['username'];
                
                $customer = new Customer();
                $customer->id = $row['id'];
                $customer->name = $row['firstname'];
                
                $customer->response = 'successful';
                
                $customer = json_encode($customer);
                echo $customer;
                
                
                
//                header("Location: /pharmacy/new/package/default/index-v1.php");
                exit();
                
               
            }
//            
        }else{
            
            echo 'incorrect username';
//            header("Location: /pharmacy/?error=wronginput1");
            exit();
        }
//        
//        
    }
        
        
    
    
    











