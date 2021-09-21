const { hasUncaughtExceptionCaptureCallback } = require('process');

describe('Login', () => {
  it('Acessa página de login!', () => {
    cy.visit('http://localhost');

    cy.contains('Login');
    // cy.contains('Faça login em sua conta');

    cy.get('input[formcontrolname=usuario]')
      .type('usuario1')
      .should('have.value', 'usuario1');
    cy.get('input[formcontrolname=senha]')
      .type('senha123')
      .should('have.value', 'senha123');
    cy.get('.btn-primary').click();

    // cy.contains('Renata Soares');

    // cy.get('app-sidebar').click();
    // cy.get('app-sidebar-nav').click();
    // cy.get('app-sidebar-nav-items').contains('AIT').click();
  });
});
