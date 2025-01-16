/*問題１*/
SELECT `users`.`first_name`,`users`.`last_name`
FROM `twitter`.`users`;

/*問題２*/
SELECT `users`.`first_name`,`users`.`last_name`,`tweets`.`tweet`
FROM `twitter`.`users`
INNER JOIN `twitter`.`tweets`
ON `users`.`id` = `tweets`.`user_id`
WHERE `users`.`first_name` = 'John' AND `users`.`last_name` = 'Doe';

/*問題３*/
SELECT `users`.`first_name`,`users`.`last_name`,`replys`.`reply`
FROM `twitter`.`users`
INNER JOIN `twitter`.`replys`
ON `users`.`id` = `replys`.`user_id`
WHERE `users`.`first_name` = 'Jane' AND `users`.`last_name` = 'Smith';

/*問題４*/
SELECT `users`.`first_name`,`users`.`last_name`
FROM `twitter`.`users`
LEFT JOIN `twitter`.`replys`
ON `users`.`id` = `replys`.`user_id`
WHERE `replys`.`reply` = 'NULL';

/*問題５*/
SELECT COUNT(`tweets`.`tweet`)
FROM `twitter`.`users` 
INNER JOIN `twitter`.`tweets` ON `users`.`id` = `tweets`.`user_id` 
WHERE `users`.`first_name` = 'Charlie' AND `users`.`last_name` = 'Brown';

/*問題６ 暫定*/
SELECT `replys`.`tweet_id`,`count`
FROM `twitter`.`replys`,(SELECT `replys`.`tweet_id`,COUNT(`replys`.`tweet_id`) AS `count`
      FROM `twitter`.`replys`
      GROUP BY `replys`.`tweet_id`)v
GROUP BY `replys`.`tweet_id`
HAVING `count` = MAX(`count`);

/*問題７*/
SELECT `tweets`.`tweet`,`replys`.`reply`
FROM `twitter`.`tweets`
LEFT JOIN `twitter`.`replys` ON `tweets`.`id` = `replys`.`tweet_id`;

/*問題８*/
SELECT `users`.`first_name`,`users`.`last_name`,COUNT(`tweets`.`user_id`),COUNT(`replys`.`user_id`)
FROM `twitter`.`users`
LEFT JOIN `twitter`.`tweets` ON `users`.`id` = `tweets`.`user_id` 
LEFT JOIN`twitter`.`replys` ON `users`.`id` = `replys`.`user_id`
GROUP BY  `users`.`id`;

/*問題９ 暫定*/

SELECT `users`.`first_name`,`users`.`last_name`
FROM (SELECT `users`.`first_name`,`users`.`last_name`,`replys`.`user_id`,COUNT(`replys`.`user_id`) AS `count`
      FROM `twitter`.`replys`
      LEFT JOIN `twitter`.`users` ON `replys`.`user_id` = `users`.`id`
      GROUP BY `replys`.`user_id`
      HAVING `count` = MAX(`count`)
      
      )v,`twitter`.`replys`,`twitter`.`users`
GROUP BY`users`.`id`;

/*問題１０*/
SELECT `users`.`id`,`users`.`first_name`,`users`.`last_name`,`tweets`.`tweet`,`replys`.`user_id`,`replys`.`reply`
FROM `twitter`.`users`
LEFT JOIN `twitter`.`tweets` ON `users`.`id` = `tweets`.`user_id` 
LEFT JOIN`twitter`.`replys` ON `tweets`.`id` = `replys`.`tweet_id`
GROUP BY  `users`.`id`;