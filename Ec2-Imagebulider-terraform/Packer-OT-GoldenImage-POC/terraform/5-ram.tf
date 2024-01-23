
data "aws_imagebuilder_image" "example" {
  arn = "arn:aws:imagebuilder:us-west-2:072616322033:image/test-reciepe/1.0.0/5"
}
resource "aws_ram_resource_share" "example" {
  name                      = "example"
  allow_external_principals = true

  tags = {
    Environment = "Production"
  }
}
resource "aws_ram_resource_association" "example" {
  resource_arn       = aws_imagebuilder_image.this.arn
  resource_share_arn = aws_ram_resource_share.example.arn
}
resource "aws_ram_principal_association" "example" {
  principal          = "${var.share_accounts}"
  resource_share_arn = aws_ram_resource_share.example.arn
}