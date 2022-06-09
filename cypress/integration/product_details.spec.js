describe('Product Details', () => {
  it('visits the homepage', () => {
    //visit homepage
    cy.visit('http://0.0.0.0:3000');
  });

  it('should navigate to a product detail page', () => {
    cy.get(".products article")
      .first()
      .click();

    cy.contains('.product-detail', 'Add');
  });
});