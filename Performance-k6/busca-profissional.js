import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  vus: 30,
  duration: '30s',
};

export default function () {
  const res = http.get('https://paciente-staging.lacreisaude.com.br/saude/paciente/profissional/busca/?q=sao+paulo');

  check(res, {
    'status é 200': (r) => r.status === 200,
  });

  sleep(1);
}