#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"
#include "sensor_msgs/Joy.h"

#include <geometry_msgs/Twist.h>
#include <cmath>
#include <sstream>
#include <iostream>


class JoyTransfer
{
public:
 JoyTransfer();

private:
  void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);

  ros::NodeHandle nh_;
  int forward_, steering_,reverse_;

  ros::Publisher ang_pub_;
  ros::Publisher vel_pub_;
  ros::Subscriber joy_sub_;


};


JoyTransfer::JoyTransfer():
  steering_(0),
  forward_(5),
  reverse_(5)

{
  

  //vel_pub_ = nh_.advertise<i2cpwm_board::ServoArray>("servos_absolute",1000);
  vel_pub_ = nh_.advertise<std_msgs::Float64>("/vehicle/speed_cmd", 100);
  ang_pub_ = nh_.advertise<std_msgs::Float64>("/vehicle/steering_cmd",100);


  joy_sub_ = nh_.subscribe<sensor_msgs::Joy>("joy", 10, &JoyTransfer::joyCallback, this);

}

void JoyTransfer::joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
{
    std_msgs::Float64 vel_command;
    std_msgs::Float64 ang_command;


    vel_command.data=330-(1-joy->axes[forward_])*15+(joy->buttons[reverse_])*10;
    ang_command.data=300-(joy->axes[steering_])*40;


  
    vel_pub_.publish(vel_command);
    ang_pub_.publish(ang_command);
  
}


int main(int argc, char** argv)
{
  ros::init(argc, argv, "joy_transfer");
  JoyTransfer joy_transfer;

  ros::spin();
}
