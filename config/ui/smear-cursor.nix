{...}: {
  config.plugins.smear-cursor = {
    enable = false;
    settings = {
      time_interval = 7;
      stiffness = 0.8;
      trailing_stiffness = 0.5;
      stiffness_insert_mode = 0.7;
      trailing_stiffness_insert_mode = 0.7;
      damping = 0.8;
      distance_stop_animating = 0.5;
    };
  };
}
