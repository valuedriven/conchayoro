const supertest = require('supertest');
const app = require('../../app');
const request = supertest(app);

test('Acesso ao root de app', async done => {
    const response = await request.get('/');
    expect(response.status).toBe(200);
    expect(response.text).toBe('Bem vindo ao backend ConchayOro!');
    done();
})