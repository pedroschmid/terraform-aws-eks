resource "aws_autoscaling_policy" "autoscaling_cpu_up_policy" {
  name            = format("%s-nodes-cpu-scale-up", var.cluster_name)
  adjustment_type = "ChangeInCapacity"

  cooldown           = lookup(var.auto_scale_cpu, "scale_up_cooldown")
  scaling_adjustment = lookup(var.auto_scale_cpu, "scale_up_add")

  autoscaling_group_name = aws_eks_node_group.node_group.resources[0].autoscaling_groups[0].name
}

resource "aws_autoscaling_policy" "autoscaling_cpu_down_policy" {
  name            = format("%s-nodes-cpu-scale-up", var.cluster_name)
  adjustment_type = "ChangeInCapacity"

  cooldown           = lookup(var.auto_scale_cpu, "scale_up_cooldown")
  scaling_adjustment = lookup(var.auto_scale_cpu, "scale_up_add")

  autoscaling_group_name = aws_eks_node_group.node_group.resources[0].autoscaling_groups[0].name
}