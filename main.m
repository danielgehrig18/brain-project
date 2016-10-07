[b, error, r_squared] = train_b('data/set_train', 'data/targets.csv', 720, 810);
submission(b, 'data/set_test', 720, 810);

