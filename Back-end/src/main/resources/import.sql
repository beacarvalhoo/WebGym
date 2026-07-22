-- Categorias musculares
INSERT INTO categorias (id, nome) SELECT 1, 'Pernas' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 1);
INSERT INTO categorias (id, nome) SELECT 2, 'Peito' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 2);
INSERT INTO categorias (id, nome) SELECT 3, 'Costas' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 3);
INSERT INTO categorias (id, nome) SELECT 4, 'Ombros' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 4);
INSERT INTO categorias (id, nome) SELECT 5, 'Biceps' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 5);
INSERT INTO categorias (id, nome) SELECT 6, 'Triceps' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 6);
INSERT INTO categorias (id, nome) SELECT 7, 'Abdomen' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 7);
INSERT INTO categorias (id, nome) SELECT 8, 'Gluteos' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 8);
INSERT INTO categorias (id, nome) SELECT 9, 'Panturrilhas' WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE id = 9);

-- Pernas
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Agachamento Livre', 'https://i.pinimg.com/736x/c6/82/3b/c6823bfc98286b196e190c51c1477ba8.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Agachamento Livre');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Leg Press 45', 'https://i.pinimg.com/736x/d8/20/8c/d8208cee8d94a03518b53176d602db56.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Leg Press 45');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Cadeira Extensora', 'https://i.pinimg.com/1200x/51/41/5c/51415c9cfa4e6d2b9f0e2bf3c123bd33.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Cadeira Extensora');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Mesa Flexora', 'https://i.pinimg.com/1200x/97/08/47/970847b447e8c1319b79ae73846abca9.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Mesa Flexora');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Agachamento Hack', 'https://i.pinimg.com/1200x/47/55/d9/4755d93dbe81208be165d46d2140c612.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Agachamento Hack');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Agachamento Sumo', 'https://i.pinimg.com/1200x/c4/b1/24/c4b12486001dd7306edd98abe5238023.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Agachamento Sumo');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Stiff', 'https://i.pinimg.com/1200x/b8/18/f1/b818f196a9a7c3e7dec2fcddce623949.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Stiff');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Afundo com Halteres', 'https://i.pinimg.com/1200x/2b/f9/70/2bf97018b4f9e0ce862e5e8c7ea38b9a.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Afundo com Halteres');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Levantamento Terra Romeno', 'https://i.pinimg.com/1200x/f4/a9/d8/f4a9d84f5c5db249c7271922ed826a59.jpg', 1 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Levantamento Terra Romeno');

-- Peito
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Supino Reto', 'https://i.pinimg.com/736x/bc/e8/aa/bce8aaf1e17ded8eb7f788ab056635fa.jpg', 2 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Supino Reto');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Supino Inclinado', 'https://i.pinimg.com/736x/da/97/40/da9740d46c4c1c1b91ed5d506ca6742d.jpg', 2 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Supino Inclinado');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Supino Declinado', 'https://i.pinimg.com/736x/79/63/dd/7963ddcfa4afd5277737281506ea0c86.jpg', 2 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Supino Declinado');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Crucifixo Reto', 'https://i.pinimg.com/736x/5b/f1/41/5bf14171be6831ef4c708817d6a4b795.jpg', 2 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Crucifixo Reto');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Crucifixo Inclinado', 'https://i.pinimg.com/1200x/4e/37/87/4e378798b7c77bd3613935541659cfa4.jpg', 2 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Crucifixo Inclinado');

-- Costas
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Puxada Frente', 'https://i.pinimg.com/1200x/6a/9d/50/6a9d505f190d30b00f9fb14670bb504e.jpg', 3 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Puxada Frente');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Remada Curvada', 'https://i.pinimg.com/736x/64/26/1d/64261d6e021c8874ffe0970f55341e76.jpg', 3 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Remada Curvada');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Remada Baixa', 'https://i.pinimg.com/736x/8e/c7/eb/8ec7eb7131d529422978fa9f190a80d0.jpg', 3 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Remada Baixa');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Remada Unilateral', 'https://i.pinimg.com/1200x/79/c5/e8/79c5e840a294f9c15d7caaa170f6e131.jpg', 3 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Remada Unilateral');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Barra Fixa', 'https://i.pinimg.com/736x/1f/e5/5b/1fe55b0f337ddcd42f82f5e99c0c2f63.jpg', 3 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Barra Fixa');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Remada Cavalinho', 'https://i.pinimg.com/736x/f8/06/a0/f806a0a2f7fd7c37742d07974c8e7637.jpg', 3 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Remada Cavalinho');

-- Ombros

INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Desenvolvimento com Halteres', 'https://i.pinimg.com/736x/c6/4c/c6/c64cc687a28eb6dfde31281e8de93db9.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Desenvolvimento com Halteres');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Elevacao Lateral', 'https://i.pinimg.com/736x/2e/c9/e7/2ec9e7fcac8df4dcdba82bcefdf38e62.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Elevacao Lateral');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Elevacao Frontal', 'https://i.pinimg.com/1200x/0c/37/4b/0c374bf004d0ada268ce272605a0c1d3.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Elevacao Frontal');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Crucifixo Inverso', 'https://i.pinimg.com/736x/d1/1c/4f/d11c4fc5e0421259b1ce215a9e878e8d.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Crucifixo Inverso');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Remada Alta', 'https://i.pinimg.com/1200x/fe/cc/b1/feccb1f880a5f86763c98c68db06d758.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Remada Alta');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Arnold Press', 'https://i.pinimg.com/736x/93/90/ed/9390ed8e609875fec3209a8d77a39d14.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Arnold Press');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Face Pull', 'https://i.pinimg.com/736x/95/c7/1d/95c71d9d4897a6e661938d72617604a4.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Face Pull');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Encolhimento', 'https://i.pinimg.com/736x/9c/f7/ce/9cf7ce6911b7f38f2dbd73b0e6f366e7.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Encolhimento');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Desenvolvimento Maquina', 'https://i.pinimg.com/1200x/c2/42/1f/c2421f766abf6b5190a989ae0569347b.jpg', 4 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Desenvolvimento Maquina');

-- Biceps
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Rosca Direta', 'https://i.pinimg.com/736x/6b/7a/39/6b7a396dff0042d89889ccb5aa807acb.jpg', 5 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Rosca Direta');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Rosca Alternada', 'https://i.pinimg.com/736x/ab/15/59/ab1559f962dfeaa5230acf7cc138abdd.jpg', 5 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Rosca Alternada');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Rosca Martelo', 'https://i.pinimg.com/736x/cf/f6/18/cff6186b52319c1d4e89b6defe6b8d2f.jpg', 5 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Rosca Martelo');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Rosca Scott', 'https://i.pinimg.com/736x/18/f2/f4/18f2f43d9d900e4c124017361ce9f5c4.jpg', 5 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Rosca Scott');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Rosca Concentrada', 'https://i.pinimg.com/736x/97/57/0d/97570d35180c98c80a6fcd98bbfd2232.jpg', 5 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Rosca Concentrada');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Rosca na Polia', 'https://i.pinimg.com/736x/5c/d9/f7/5cd9f716d072435e35cc890c4560e7c7.jpg', 5 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Rosca na Polia');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Rosca Inclinada', 'https://i.pinimg.com/736x/4e/80/14/4e80143d99d285e0cc4346f50ce0480d.jpg', 5 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Rosca Inclinada');


-- Triceps
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Triceps Testa', 'https://i.pinimg.com/736x/fa/d3/d3/fad3d3c7773be1b2b16cdfa470ed6b75.jpg', 6 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Triceps Testa');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Triceps Corda', 'https://i.pinimg.com/736x/47/64/4e/47644e2924615b3b56d45f8f03948d4e.jpg', 6 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Triceps Corda');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Triceps Frances', 'https://i.pinimg.com/736x/84/dc/35/84dc3595251793d8e048812fcfa28ac8.jpg', 6 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Triceps Frances');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Triceps Coice', 'https://i.pinimg.com/736x/77/2b/e3/772be3a65d31b8283e8d046003a2d04b.jpg', 6 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Triceps Coice');

-- Abdomen
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Abdominal Supra', 'https://i.pinimg.com/736x/7e/65/20/7e6520dfb28c0eec82a325ccd220fdc5.jpg', 7 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Abdominal Supra');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Abdominal Infra', 'https://i.pinimg.com/1200x/e9/82/fa/e982faa2141025c8783cf5c9821ccbc4.jpg', 7 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Abdominal Infra');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Prancha', 'https://i.pinimg.com/1200x/e4/a3/73/e4a3738eb7a7579e79c4e27918eab859.jpg', 7 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Prancha');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Prancha Lateral', 'https://i.pinimg.com/736x/e6/4b/64/e64b6484d1711c210f76183b353cb1f1.jpg', 7 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Prancha Lateral');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Abdominal Bicicleta', 'https://i.pinimg.com/1200x/ec/4a/64/ec4a646d01a57ccbeaf33761681f0f4d.jpg', 7 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Abdominal Bicicleta');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Russian Twist', 'https://i.pinimg.com/1200x/c2/4b/16/c24b166ffb9c5cb5e4f4826e144303a2.jpg', 7 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Russian Twist');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Ab Wheel', 'https://i.pinimg.com/736x/b6/78/76/b67876bd2322e374dd17dc6c2d2cb465.jpg', 7 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Ab Wheel');

-- Gluteos
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Elevacao Pelvica', 'https://i.pinimg.com/736x/c3/b3/94/c3b3945a6e8332bb4e4c2692ef2df57c.jpg', 8 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Elevacao Pelvica');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Gluteo na Polia', 'https://i.pinimg.com/1200x/d0/6c/20/d06c208f91e1b1aca2e23c3984dd2914.jpg', 8 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Gluteo na Polia');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Cadeira Abdutora', 'https://i.pinimg.com/736x/56/3a/17/563a17ce5904c6584754636c8836855d.jpg', 8 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Cadeira Abdutora');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Agachamento Bulgaro', 'https://i.pinimg.com/1200x/b5/8d/13/b58d135c8e36c88b3a1a9eec1c0e627e.jpg', 8 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Agachamento Bulgaro');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Step Up', 'https://i.pinimg.com/736x/d0/4a/02/d04a02886db8aaa5cb31b345b0818094.jpg', 8 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Step Up');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Ponte de Gluteos', 'https://i.pinimg.com/1200x/23/e0/3c/23e03c66a9f5d92b1f60272e45cb91dc.jpg', 8 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Ponte de Gluteos');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Good Morning', 'https://i.pinimg.com/1200x/bb/25/ee/bb25eefb48a289c491e3e1d3c0492f5b.jpg', 8 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Good Morning');

-- Panturrilhas
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Panturrilha em Pe', 'https://i.pinimg.com/736x/e0/b0/2c/e0b02c46bc46cadc69656f39a59f84f1.jpg', 9 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Panturrilha em Pe');
INSERT INTO exercicios (nome, url_imagem, categoria_id) SELECT 'Panturrilha Sentado', 'https://i.pinimg.com/1200x/88/df/be/88dfbe272a14ac79fb390f0208d21a0c.jpg', 9 WHERE NOT EXISTS (SELECT 1 FROM exercicios WHERE nome = 'Panturrilha Sentado');
