/*
 * Copyright (C) 2009-2013 Slava Semushin <slava.semushin@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
package ru.mystamps.web.service

import java.util.{Date, List}

import javax.inject.Inject

import scala.collection.JavaConverters.asScalaBufferConverter

import org.apache.commons.lang3.time.DateUtils
import org.apache.commons.lang3.Validate

import org.slf4j.{Logger, LoggerFactory}

import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

import ru.mystamps.web.dao.UsersActivationDao
import ru.mystamps.web.entity.UsersActivation

@Service
class CronServiceImpl extends CronService {
	private val CHECK_PERIOD: Long = 12 * DateUtils.MILLIS_PER_HOUR
	
	private val LOG: Logger = LoggerFactory.getLogger(classOf[CronService])
	
	@Inject
	private var usersActivationDao: UsersActivationDao = _
	
	@Scheduled(fixedDelay = CHECK_PERIOD)
	@Transactional
	override def purgeUsersActivations(): Unit = {
		val expiredSince: Date = DateUtils.addDays(new Date(), -CronService.PURGE_AFTER_DAYS)
		
		val expiredActivations: List[UsersActivation] =
			usersActivationDao.findByCreatedAtLessThan(expiredSince)
		
		Validate.validState(expiredActivations != null, "Expired activations should be non null")
		
		if (expiredActivations.isEmpty()) {
			LOG.info("Expired activations was not found.")
			return
		}
		
		expiredActivations.asScala.foreach(
			activation => LOG.info(
				"Delete expired activation (key: {}, email: {}, created: {})",
				activation.getActivationKey(),
				activation.getEmail(),
				activation.getCreatedAt()
			)
		);
		
		usersActivationDao.delete(expiredActivations)
	}
	
}
