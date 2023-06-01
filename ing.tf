ingress {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }


#add routing as well
resource "aws_route" "update" {
    provider               = aws.docdb_peer
    route_table_id         = "${aws_vpc.docdb_peer.default_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = "${aws_internet_gateway.gw_connect.id}"
}
