describe('Product Details', () => {
  it('visits the homepage', () => {
    //visit homepage
    cy.visit('http://0.0.0.0:3000');
  });

  it('should add a product from homepage', () => {
    cy.get(".end-0").should(
      // wow this chainer was super hard to find (should > assertions)
      'include.text',
      'My Cart (0)'
    );

    cy.get('.btn')
      .first()
      .click({ force: true });

    cy.get(".end-0").should(
      // wow this chainer was super hard to find (should > assertions)
      'include.text',
      'My Cart (1)'
    );

  });
});