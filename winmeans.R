win.means = aggregate(data=training,
          cbind(roll_dumbbell, pitch_dumbbell, yaw_dumbbell, total_accel_dumbbell,
                roll_belt,     pitch_belt,     yaw_belt,     total_accel_belt,
                roll_arm,      pitch_arm,      yaw_arm,      total_accel_arm,
                roll_forearm,  pitch_forearm,  yaw_forearm,  total_accel_forearm)~user_name+classe + num_window,
          FUN=mean)
