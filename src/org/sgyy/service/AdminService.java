package org.sgyy.service;

import org.sgyy.domain.Admin;

public interface AdminService {

	Admin login(Integer aid, String apwd);
}
