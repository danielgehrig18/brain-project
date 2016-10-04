[b, error, r_squared] = train_b('data/targets.csv', 'data/set_train', 720, 810);
submission(b, 'data/set_test', 720, 810);

