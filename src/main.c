/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikarjala <ikarjala@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/30 18:23:07 by ikarjala          #+#    #+#             */
/*   Updated: 2022/06/30 22:02:21 by ikarjala         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

int	parse_flags(char **argv)
{
	argv = NULL; //DEBUG
	return (0);
/* 	const char		shortflags[] = "halRrt";
	unsigned int	ai;
	unsigned int	si;

	ai = 0;
	while (argv[++ai])
	{
		si = 0;
		if (argv[ai][si++] == '-')
			return (XC_ERROR); // FOR NOW
	}
	return (0); // FOR NOW */
}

int	main(int argc, char **argv)
{
	DIR				*dir_p;
	struct dirent	*entry;

	parse_flags(argv);
	if (argc == 1)
	{
		// print current directory
		dir_p = opendir(".");
		if (dir_p == NULL)
			return (XC_ERROR);
		while ((entry = readdir(dir_p)) != NULL)
		{
			write(FD_OUT, entry->d_name, entry->d_namlen);
			write(FD_OUT, "\n", 1);
		}
		closedir(dir_p);
	}
}
