resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarm_cpu_up" {

  alarm_name = format("%s-nodes-cpu-high", var.cluster_name)

  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"

  evaluation_periods = lookup(var.auto_scale_cpu, "scale_up_evaluation")
  period             = lookup(var.auto_scale_cpu, "scale_up_period")
  threshold          = lookup(var.auto_scale_cpu, "scale_up_threshold")

  dimensions = {
    AutoScalingGroupName = aws_eks_node_group.node_group.resources[0].autoscaling_groups[0].name
  }

  alarm_actions = [aws_autoscaling_policy.autoscaling_cpu_up_policy.arn]

}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarm_cpu_down" {

  alarm_name = format("%s-nodes-cpu-low", var.cluster_name)

  comparison_operator = "LessThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"

  evaluation_periods = lookup(var.auto_scale_cpu, "scale_down_evaluation")
  period             = lookup(var.auto_scale_cpu, "scale_down_period")
  threshold          = lookup(var.auto_scale_cpu, "scale_down_threshold")

  dimensions = {
    AutoScalingGroupName = aws_eks_node_group.node_group.resources[0].autoscaling_groups[0].name
  }

  alarm_actions = [aws_autoscaling_policy.autoscaling_cpu_down_policy.arn]

}