resource "aws_route_table" "rt" {
  count  = "${var.create_vpc ? length(var.subnets) :0}"
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.env}-${var.type}-rt0${count.index + 1}"
    env = "${var.env}"
  }
}

resource "aws_route_table_association" "rtassociaton" {
  count          = "${var.create_vpc ? length(var.subnets) : 0}"
  subnet_id      = "${element(var.subnet_id, count.index)}"
  route_table_id = "${element(aws_route_table.rt.*.id, count.index)}"
}