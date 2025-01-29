use company;

insert into department values
(1, 'HR', 1, '2023-01-01'),
(2, 'IT', 2, '2023-02-01'),
(3, 'Finance', 3, '2023-03-01'),
(4, 'Accounts', 4, '2023-04-01'),
(5, 'Production', 5, '2023-05-01');

insert into employee values
(1, 'John Doe', '123 Main st', 'M', 500000, 3, 1),
(2, 'Jane Smith', '345 Main st', 'F', 600008, 1, 4),
(3, 'Bob Johnson', '578 Main st', 'M', 550009, 2, 4),
(4, 'Alice Brown', '12234 Main st', 'F', 700009, 4, 3),
(5, 'Miller Scott', '12214 Main st', 'M', 800700, 2, 1);

insert into dlocation values
(1, 'New York'),
(2, 'San Francisco'),
(3, 'Chicago'),
(4, 'Alaska'),
(5, 'California');

insert into project values
(101, 'Iot', 'New York',2),
(102, 'System Testing', 'San Francisco', 5),
(103, 'Product optmisation', 'Chicago', 5),
(104, 'yeild increase', 'California', 5),
(105, 'Product Refinement', 'Alaska', 5);

insert into works_on values
(1, 101, 40),
(2, 102, 30),
(3, 101, 20),
(4, 103, 25),
(5, 102, 35);