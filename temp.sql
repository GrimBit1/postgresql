CREATE TABLE temp (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50),
    bio VARCHAR(500)
);
INSERT INTO temp(name, bio)
values(
        'Aditya',
        'https://images.unsplash.com/photo-1683526017468-c7c9d5e3448e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'
    );
    SELECT * FROM temp;
    drop TABLE temp;