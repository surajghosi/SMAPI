﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.Common
{
    public static class ApiMessageConstants
    {
        public static string emailAlreadyExists="Email address already exists. Please try with new email address";
        public static string orgAlreadyExists = "Orgnization name address already exists. Please try with new orgnization name";
        public static string wrongUserNameAndPassword = "Username and password invalid. Please try again.";
        public static string loginSuccessfully = "Login Successfully.";
        public static string userAddedSuccessfully = "User Added Successfully.";
        public static string registrationSuccessfully = "Registration successful. Please login.";
        public static string ModelNotValid = "Request parameter not valid";
        public static string someThingWentWrong = "Something went wrong . Please try after sometime";
        public static string userDelete = "User deleted successfully";
        public static string  updateUserSuccessfully= "User Updated successfully";

        // Pipe Line message
        public static string pipeAlreadyExists = "PipeLine name  already exists. Please try with new name";
        public static string pipeAdded = "PipeLine Added Successfully.";
        public static string pipeDeleted = "PipeLine deleted Successfully.";
        public static string pipeUpdated = "PipeLine Updated Successfully.";

    }
    

    public class ApiResponse
    {
        public string message { get; set; }
        public dynamic data { get; set; }
    }
}

