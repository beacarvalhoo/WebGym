-- Categorias musculares
INSERT INTO categorias (id, nome) VALUES (1, 'Pernas') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (2, 'Peito') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (3, 'Costas') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (4, 'Ombros') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (5, 'Biceps') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (6, 'Triceps') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (7, 'Abdomen') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (8, 'Gluteos') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;
INSERT INTO categorias (id, nome) VALUES (9, 'Panturrilhas') ON CONFLICT (id) DO UPDATE SET nome = EXCLUDED.nome;

-- Pernas
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Agachamento Livre', 'https://i.pinimg.com/736x/c6/82/3b/c6823bfc98286b196e190c51c1477ba8.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Leg Press 45', 'https://i.pinimg.com/736x/d8/20/8c/d8208cee8d94a03518b53176d602db56.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Cadeira Extensora', 'https://i.pinimg.com/1200x/51/41/5c/51415c9cfa4e6d2b9f0e2bf3c123bd33.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Mesa Flexora', 'https://i.pinimg.com/1200x/97/08/47/970847b447e8c1319b79ae73846abca9.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Agachamento Hack', 'https://i.pinimg.com/1200x/47/55/d9/4755d93dbe81208be165d46d2140c612.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Agachamento Sumo', 'https://i.pinimg.com/1200x/c4/b1/24/c4b12486001dd7306edd98abe5238023.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Stiff', 'https://i.pinimg.com/1200x/b8/18/f1/b818f196a9a7c3e7dec2fcddce623949.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Afundo com Halteres', 'https://i.pinimg.com/1200x/2b/f9/70/2bf97018b4f9e0ce862e5e8c7ea38b9a.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Levantamento Terra Romeno', 'https://i.pinimg.com/1200x/f4/a9/d8/f4a9d84f5c5db249c7271922ed826a59.jpg', 1) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;

-- Peito
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Supino Reto', 'https://i.pinimg.com/736x/bc/e8/aa/bce8aaf1e17ded8eb7f788ab056635fa.jpg', 2) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Supino Inclinado', 'https://i.pinimg.com/736x/da/97/40/da9740d46c4c1c1b91ed5d506ca6742d.jpg', 2) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Supino Declinado', 'https://i.pinimg.com/736x/79/63/dd/7963ddcfa4afd5277737281506ea0c86.jpg', 2) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Crucifixo Reto', 'https://i.pinimg.com/736x/5b/f1/41/5bf14171be6831ef4c708817d6a4b795.jpg', 2) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Crucifixo Inclinado', 'https://i.pinimg.com/1200x/4e/37/87/4e378798b7c77bd3613935541659cfa4.jpg', 2) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;

-- Costas
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Puxada Frente', 'https://i.pinimg.com/1200x/6a/9d/50/6a9d505f190d30b00f9fb14670bb504e.jpg', 3) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Remada Curvada', 'https://i.pinimg.com/736x/64/26/1d/64261d6e021c8874ffe0970f55341e76.jpg', 3) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Remada Baixa', 'https://i.pinimg.com/1200x/19/6e/5a/196e5af19b54351ed889dd93263d7490.jpg', 3) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Remada Unilateral', 'https://i.pinimg.com/1200x/79/c5/e8/79c5e840a294f9c15d7caaa170f6e131.jpg', 3) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Barra Fixa', 'https://i.pinimg.com/736x/1f/e5/5b/1fe55b0f337ddcd42f82f5e99c0c2f63.jpg', 3) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Remada Cavalinho', 'https://i.pinimg.com/736x/f8/06/a0/f806a0a2f7fd7c37742d07974c8e7637.jpg', 3) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;

-- Ombros

INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Desenvolvimento com Halteres', 'https://i.pinimg.com/736x/c6/4c/c6/c64cc687a28eb6dfde31281e8de93db9.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Elevacao Lateral', 'https://i.pinimg.com/736x/2e/c9/e7/2ec9e7fcac8df4dcdba82bcefdf38e62.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Elevacao Frontal', 'https://i.pinimg.com/1200x/0c/37/4b/0c374bf004d0ada268ce272605a0c1d3.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Crucifixo Inverso', 'https://i.pinimg.com/736x/d1/1c/4f/d11c4fc5e0421259b1ce215a9e878e8d.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Remada Alta', 'https://i.pinimg.com/1200x/fe/cc/b1/feccb1f880a5f86763c98c68db06d758.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Arnold Press', 'https://i.pinimg.com/736x/93/90/ed/9390ed8e609875fec3209a8d77a39d14.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Face Pull', 'https://i.pinimg.com/736x/95/c7/1d/95c71d9d4897a6e661938d72617604a4.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Encolhimento', 'https://i.pinimg.com/736x/9c/f7/ce/9cf7ce6911b7f38f2dbd73b0e6f366e7.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Desenvolvimento Maquina', 'https://i.pinimg.com/1200x/c2/42/1f/c2421f766abf6b5190a989ae0569347b.jpg', 4) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;

-- Biceps
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Rosca Direta', 'https://i.pinimg.com/736x/6b/7a/39/6b7a396dff0042d89889ccb5aa807acb.jpg', 5) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Rosca Alternada', 'https://i.pinimg.com/736x/ab/15/59/ab1559f962dfeaa5230acf7cc138abdd.jpg', 5) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Rosca Martelo', 'https://i.pinimg.com/736x/cf/f6/18/cff6186b52319c1d4e89b6defe6b8d2f.jpg', 5) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Rosca Scott', 'https://i.pinimg.com/736x/18/f2/f4/18f2f43d9d900e4c124017361ce9f5c4.jpg', 5) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Rosca Concentrada', 'https://i.pinimg.com/736x/97/57/0d/97570d35180c98c80a6fcd98bbfd2232.jpg', 5) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Rosca na Polia', 'https://i.pinimg.com/736x/5c/d9/f7/5cd9f716d072435e35cc890c4560e7c7.jpg', 5) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Rosca Inclinada', 'https://i.pinimg.com/736x/4e/80/14/4e80143d99d285e0cc4346f50ce0480d.jpg', 5) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;


-- Triceps
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Triceps Testa', 'https://i.pinimg.com/736x/fa/d3/d3/fad3d3c7773be1b2b16cdfa470ed6b75.jpg', 6) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Triceps Corda', 'https://i.pinimg.com/736x/47/64/4e/47644e2924615b3b56d45f8f03948d4e.jpg', 6) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Triceps Frances', 'https://i.pinimg.com/1200x/93/82/dc/9382dc4eb93c02fec71492a29142dbb9.jpg', 6) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Triceps Coice', 'https://i.pinimg.com/736x/77/2b/e3/772be3a65d31b8283e8d046003a2d04b.jpg', 6) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;

-- Abdomen
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Abdominal Supra', 'https://i.pinimg.com/736x/7e/65/20/7e6520dfb28c0eec82a325ccd220fdc5.jpg', 7) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Abdominal Infra', 'https://i.pinimg.com/1200x/e9/82/fa/e982faa2141025c8783cf5c9821ccbc4.jpg', 7) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Prancha', 'https://i.pinimg.com/1200x/e4/a3/73/e4a3738eb7a7579e79c4e27918eab859.jpg', 7) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Prancha Lateral', 'https://i.pinimg.com/736x/e6/4b/64/e64b6484d1711c210f76183b353cb1f1.jpg', 7) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Abdominal Bicicleta', 'https://i.pinimg.com/1200x/ec/4a/64/ec4a646d01a57ccbeaf33761681f0f4d.jpg', 7) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Russian Twist', 'https://i.pinimg.com/1200x/c2/4b/16/c24b166ffb9c5cb5e4f4826e144303a2.jpg', 7) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Ab Wheel', 'https://i.pinimg.com/736x/b6/78/76/b67876bd2322e374dd17dc6c2d2cb465.jpg', 7) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;

-- Gluteos
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Elevacao Pelvica', 'https://i.pinimg.com/1200x/dd/45/d4/dd45d408e87cca3787fe13d94a653073.jpg', 8) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Gluteo na Polia', 'https://i.pinimg.com/1200x/d0/6c/20/d06c208f91e1b1aca2e23c3984dd2914.jpg', 8) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Cadeira Abdutora', 'https://i.pinimg.com/736x/56/3a/17/563a17ce5904c6584754636c8836855d.jpg', 8) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Agachamento Bulgaro', 'https://i.pinimg.com/1200x/b5/8d/13/b58d135c8e36c88b3a1a9eec1c0e627e.jpg', 8) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Step Up', 'https://i.pinimg.com/736x/d0/4a/02/d04a02886db8aaa5cb31b345b0818094.jpg', 8) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Ponte de Gluteos', 'https://i.pinimg.com/1200x/23/e0/3c/23e03c66a9f5d92b1f60272e45cb91dc.jpg', 8) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Good Morning', 'https://i.pinimg.com/1200x/bb/25/ee/bb25eefb48a289c491e3e1d3c0492f5b.jpg', 8) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;

-- Panturrilhas
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Panturrilha em Pe', 'https://i.pinimg.com/736x/e0/b0/2c/e0b02c46bc46cadc69656f39a59f84f1.jpg', 9) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
INSERT INTO exercicios (nome, url_imagem, categoria_id) VALUES ('Panturrilha Sentado', 'https://i.pinimg.com/1200x/88/df/be/88dfbe272a14ac79fb390f0208d21a0c.jpg', 9) ON CONFLICT (nome) DO UPDATE SET url_imagem = EXCLUDED.url_imagem, categoria_id = EXCLUDED.categoria_id;
