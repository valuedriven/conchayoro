const supertest = require('supertest');
const app = require('../../app');
const request = supertest(app);

it('Acesso ao root de app', async () => {
  const response = await request.get('/');
  expect(response.status).toBe(200);
  expect(response.text).toBe('Bem vindo ao backend DevOps!');
})
